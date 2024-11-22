import 'dart:async';
import 'dart:convert';

// import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:soupmarket_sdk/config/soup_market_config.dart';
import 'package:soupmarket_sdk/service/sdk_service_response.dart';
import 'package:soupmarket_sdk/utils/api_exception.dart';

class SDKServiceRequest {
  // late final Dio dio;
  late final Dio dio = Dio(); // Ensure dio is initialized
  late final SoupMarketConfig _config;

  // Singleton pattern
  static final SDKServiceRequest _instance = SDKServiceRequest._internal();
  factory SDKServiceRequest() => _instance;

  SDKServiceRequest._internal();

  // Initialize SDK
  void initialize({
    required String baseUrl,
    required String apiKey,
    required String apiSecret,
    Map<String, dynamic>? headers,
    int timeout = 30000,
  }) {
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
        return status! >= 100 && status < 2999; // Accept this status codes in the range 100-2999
      },
    );

    // Add interceptors
    dio.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      error: true,
      requestBody: true,
    ));
  }

  String getBasicAuthToken(String apiKey, String apiSecret) {
    final credentials = '$apiKey:$apiSecret';
    final encodedCredentials = base64.encode(utf8.encode(credentials));
    return 'Basic $encodedCredentials';
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
        options: Options(headers: headers),
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
        error: SDKError(
          message: 'Unexpected response: ${response.statusCode}',
          statusCode: response.statusCode,
        ),
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
        error: SDKError(
          message: 'Unexpected response: ${response.statusCode}',
          statusCode: response.statusCode,
        ),
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