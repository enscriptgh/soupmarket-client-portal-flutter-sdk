import 'dart:async';
import 'dart:collection';
import 'dart:convert';

// import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:soupmarket_sdk/config/soup_market_config.dart';
import 'package:soupmarket_sdk/service/sdk_service_response.dart';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

class SDKServiceRequest {
  // late final Dio dio;
  late final Dio dio = Dio(); // Ensure dio is initialized
  late final SoupMarketConfig _config;
  // Singleton pattern
  static final SDKServiceRequest _instance = SDKServiceRequest._internal();
  factory SDKServiceRequest() => _instance;

  final _requestQueue = Queue<Function>();
  Timer? _timer;
  int _requestLimit = 3;
  int _requestCount = 0;
  Duration _interval = Duration(seconds: 1);
  bool enableCaching = false;
  CacheOptions? cacheOptions;

  SDKServiceRequest._internal();

  // Initialize SDK
  Future<void> initialize({
    required String baseUrl,
    required String apiKey,
    required String apiSecret,
    Environment environment = Environment.test,
    Map<String, dynamic>? headers,
    int timeout = 30000,
    bool enableCaching = false,
  }) async {
    this.enableCaching = enableCaching;
    String basicAuthCredentials = getBasicAuthToken(apiKey, apiSecret);
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: timeout),
      receiveTimeout: Duration(milliseconds: timeout),
      headers: {
        'Authorization': basicAuthCredentials,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        ...?headers,
      },
      validateStatus: (status) {
        return status! >= 100 && status < 2999; // Accept status codes in the range 100-2999
      },
    );

    // Add interceptors
    dio.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      error: true,
      requestBody: true,
    ));

    if (enableCaching) {
      final appDocDir = await getApplicationDocumentsDirectory();

      cacheOptions = CacheOptions(
        store: BackupCacheStore(
          primary: MemCacheStore(maxSize: 50), // In-memory cache with max 50 items
          secondary: HiveCacheStore(appDocDir.path), // Persistent disk-based cache
        ),
        policy: CachePolicy.request,
        hitCacheOnErrorExcept: [401, 403],
        priority: CachePriority.normal,
        maxStale: const Duration(days: 7),
      );
      dio.interceptors.add(DioCacheInterceptor(options: cacheOptions!));
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _requestQueue.add(() {
            dio.fetch(options).then((response) {
              handler.resolve(response);
            }).catchError((error) {
              handler.reject(error);
            });
          });
          _processQueue();
        },
      ),
    );

    // Initialize the timer to reset the request count
    _timer = Timer.periodic(_interval, (timer) {
      _requestCount = 0;
      _processQueue();
    });
  }

  String getBasicAuthToken(String apiKey, String apiSecret) {
    final credentials = '$apiKey:$apiSecret';
    final encodedCredentials = base64.encode(utf8.encode(credentials));
    return 'Basic $encodedCredentials';
  }

  void _processQueue() {
    while (_requestQueue.isNotEmpty && _requestCount < _requestLimit) {
      _requestQueue.removeFirst()();
      _requestCount++;
    }
  }

  Future<SDKServiceResponse<T>> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers, extra: cacheOptions?.toExtra(),),
      );
      return SDKServiceResponse.success(data: response.data as T);
    } catch (e) {
      return SDKServiceResponse.error(error: _handleError(e));
    }
  }

  Future<SDKServiceResponse<T>> download<T>({
    required String endpoint,
    required String savePath,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.download(
        endpoint,
        savePath,
        queryParameters: params,
        options: Options(headers: headers),
      );
      return SDKServiceResponse.success(data: response.data as T);
    } catch (e) {
      return SDKServiceResponse.error(error: _handleError(e));
    }
  }

  Future<SDKServiceResponse<T>> post<T>({
    required String endpoint,
    // dynamic data,
  FormData? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          followRedirects: true,
          validateStatus: (status) {
            return status != null && (status >= 200 && status < 400 || status == 302);
          },
        ),
      );

      // Handle redirect responses (status code 302)
      if (response.statusCode == 302) {
        final redirectUrl = getRedirectUrl(response);
        if (redirectUrl != null) {
          // Make a GET request to the redirect URL
          final redirectResponse = await dio.get(
            redirectUrl,
            options: Options(
              headers: headers,
              validateStatus: (status) => status != null && status >= 200 && status < 300,
            ),
          );
          return SDKServiceResponse.success(data: redirectResponse.data as T);
        }
      }

      // Handle regular success responses
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SDKServiceResponse.success(data: response.data as T);
      }

      // If we get here, something unexpected happened
      return SDKServiceResponse.error(
          error: new ServiceError(code:'${response.statusCode}',
              message:'Unexpected response status code: ${response.statusCode},'
                  ' uri: ${response.requestOptions.uri}, data:${response.data as T}')
      );
    } catch (e) {
      return SDKServiceResponse.error(error: _handleError(e));
    }
  }

  Future<SDKServiceResponse<T>> put<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          followRedirects: true,
          validateStatus: (status) {
            return status != null && (status >= 200 && status < 400 || status == 302);
          },
        ),
      );

      // Handle redirect responses (status code 302)
      if (response.statusCode == 302) {
        final redirectUrl = getRedirectUrl(response);
        if (redirectUrl != null) {
          // Make a GET request to the redirect URL
          final redirectResponse = await dio.get(
            redirectUrl,
            options: Options(
              headers: headers,
              validateStatus: (status) => status != null && status >= 200 && status < 300,
            ),
          );
          return SDKServiceResponse.success(data: redirectResponse.data as T);
        }
      }

      // Handle regular success responses
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SDKServiceResponse.success(data: response.data as T);
      }

      // If we get here, something unexpected happened
      return SDKServiceResponse.error(
          error: new ServiceError(code:'${response.statusCode}',
              message:'Unexpected response status code: ${response.statusCode},'
                  ' uri: ${response.requestOptions.uri}, data:${response.data as T}')
      );
    } catch (e) {
      return SDKServiceResponse.error(error: _handleError(e));
    }
  }
  String? getRedirectUrl(Response response) {
    // Check 'location' header (standard)
    String? location = response.headers.value('location') ??
        response.headers.value('Location');

    // If location header exists and is a relative URL, make it absolute
    if (location != null && !location.startsWith('http')) {
      final baseUrl = response.requestOptions.baseUrl;
      location = Uri.parse(baseUrl).resolve(location).toString();
    }

    return location;
  }

  Future<SDKServiceResponse<T>> delete<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return SDKServiceResponse.success(data: response.data as T);
    } catch (e) {
      return SDKServiceResponse.error(error: _handleError(e));
    }
  }

  ServiceError _handleError(dynamic error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return ServiceError(
            code: 'TIMEOUT',
            message: 'Connection timeout',
            originalError: error,
          );
        case DioErrorType.badResponse:
          return ServiceError(
            code: '${error.response?.statusCode}',
            message: error.response?.data?['message'] ??
                'Unknown error occurred',
            originalError: error,
          );
        default:
          return ServiceError(
            code: 'NETWORK_ERROR',
            message: 'Network error occurred',
            originalError: error,
          );
      }
    }
    return ServiceError(
      code: 'UNKNOWN',
      message: 'Unknown error occurred',
      originalError: error,
    );
  }

}