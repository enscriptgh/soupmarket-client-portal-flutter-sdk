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
import 'package:synchronized/synchronized.dart';

/*class SDKServiceRequest {
  // late final Dio dio;
  late final Dio dio = Dio(); // Ensure dio is initialized
  late final SoupMarketConfig _config;

  // Singleton pattern
  static final SDKServiceRequest _instance = SDKServiceRequest._internal();

  factory SDKServiceRequest() => _instance;

  final _requestQueue = Queue<_QueuedRequest>();

  // final _requestQueue = Queue<Function>();
  Timer? _timer;
  int _requestLimit = 3;
  int _requestCount = 0;
  Duration _interval = Duration(seconds: 1);
  bool _isProcessing = false; // Flag to prevent concurrent queue processing

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
        return status! >= 100 &&
            status < 2999; // Accept status codes in the range 100-2999
      },
    );

    // Add interceptors
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: (object) {
        print('DIO LOG: $object'); // For debugging
      },
    ));

    // if (enableCaching) {
    //   final appDocDir = await getApplicationDocumentsDirectory();
    //
    //   cacheOptions = CacheOptions(
    //     store: BackupCacheStore(
    //       primary: MemCacheStore(maxSize: 50), // In-memory cache with max 50 items
    //       secondary: HiveCacheStore(appDocDir.path), // Persistent disk-based cache
    //     ),
    //     policy: CachePolicy.request,
    //     hitCacheOnErrorExcept: [401, 403],
    //     priority: CachePriority.normal,
    //     maxStale: const Duration(days: 7),
    //   );
    //   dio.interceptors.add(DioCacheInterceptor(options: cacheOptions!));
    // }

    // rate-limiting interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final completer = Completer<Response>();

          _requestQueue.add(_QueuedRequest(options, completer));

          // Start processing queue if not already processing
          if (!_isProcessing) {
            _processQueue();
          }

          try {
            final response = await completer.future;
            handler.resolve(response);
          } catch (error) {
            handler.reject(error as DioException);
          }
        },
      ),
    );

    // Initialize the timer to reset the request count
    // Reset request count periodically
    _timer?.cancel();
    _timer = Timer.periodic(_interval, (timer) {
      _requestCount = 0;
      if (_requestQueue.isNotEmpty && !_isProcessing) {
        _processQueue();
      }
    });
  }

  String getBasicAuthToken(String apiKey, String apiSecret) {
    final credentials = '$apiKey:$apiSecret';
    final encodedCredentials = base64.encode(utf8.encode(credentials));
    return 'Basic $encodedCredentials';
  }

  // Updated _processQueue method to handle the requests more reliably
  Future<void> _processQueue() async {
    if (_isProcessing) {
      print('DEBUG: Queue is already processing'); // Debug log
      return;
    }

    _isProcessing = true;
    print('DEBUG: Starting queue processing'); // Debug log

    try {
      while (_requestQueue.isNotEmpty && _requestCount < _requestLimit) {
        final request = _requestQueue.removeFirst();
        _requestCount++;

        try {
          print('DEBUG: Processing queued request: ${request.options.path}'); // Debug log

          final response = await dio.fetch(request.options);
          print('DEBUG: Queue processed response: ${response.statusCode}'); // Debug log

          if (!request.completer.isCompleted) {
            request.completer.complete(response);
          }
        } catch (error) {
          print('DEBUG: Error in queue processing: $error'); // Debug log
          if (!request.completer.isCompleted) {
            request.completer.completeError(error);
          }
        }
      }
    } finally {
      _isProcessing = false;
      print('DEBUG: Queue processing finished'); // Debug log
    }
  }

  // Cleanup method
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _requestQueue.clear();
    _requestCount = 0;
    _isProcessing = false;
  }

  Future<SDKServiceResponse<T>> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final completer = Completer<Response>();

      // Merge default headers with custom headers
      final mergedHeaders = {
        ...dio.options.headers,
        ...?headers,
      };

      final options = RequestOptions(
        path: endpoint,
        method: 'GET',
        queryParameters: queryParameters,
        baseUrl: dio.options.baseUrl,
        headers: mergedHeaders,
      );

      print('Queueing GET request to: $endpoint'); // Debug log

      _requestQueue.add(_QueuedRequest(options, completer));

      if (!_isProcessing) {
        _processQueue();
      }

      // Start the rate limit reset timer if not already started
      _timer ??= Timer.periodic(_interval, (timer) {
        _requestCount = 0;
        if (_requestQueue.isNotEmpty && !_isProcessing) {
          _processQueue();
        }
      });

      // Set up caching if enabled
      if (enableCaching) {
        final appDocDir = await getApplicationDocumentsDirectory();
        cacheOptions = CacheOptions(
          store: BackupCacheStore(
            primary: MemCacheStore(maxSize: 50),
            secondary: HiveCacheStore(appDocDir.path),
          ),
          policy: CachePolicy.request,
          hitCacheOnErrorExcept: [401, 403],
          priority: CachePriority.normal,
          maxStale: const Duration(days: 7),
        );

        // Add cache interceptor if not already added
        if (!dio.interceptors.any((i) => i is DioCacheInterceptor)) {
          dio.interceptors.add(DioCacheInterceptor(options: cacheOptions!));
        }
      }

      // Wait for the rate-limited request to complete
      final response = await completer.future;

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
      final completer = Completer<Response>();

      final options = RequestOptions(
        path: endpoint,
        method: 'GET', // Download uses GET
        queryParameters: params,
        baseUrl: dio.options.baseUrl,
        headers: {...dio.options.headers, ...?headers},
        extra: {'savePath': savePath}, // Pass savePath in extra
      );

      print('Queueing DOWNLOAD request to: $endpoint');

      _requestQueue.add(_QueuedRequest(options, completer));

      if (!_isProcessing) {
        _processQueue();
      }

      _timer ??= Timer.periodic(_interval, (timer) {
        _requestCount = 0;
        if (_requestQueue.isNotEmpty && !_isProcessing) {
          _processQueue();
        }
      });

      final response = await completer.future;
      return SDKServiceResponse.success(data: response.data as T);
    } catch (e) {
      return SDKServiceResponse.error(error: _handleError(e));
    }
  }

  Future<SDKServiceResponse<T>> post<T>({
    required String endpoint,
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      // Create a completer to handle the response
      final completer = Completer<Response>();

      // Create request options with all necessary parameters
      final options = RequestOptions(
        path: endpoint,
        method: 'POST',
        data: data,
        queryParameters: queryParameters,
        baseUrl: dio.options.baseUrl,
        headers: {...dio.options.headers, ...?headers},
        followRedirects: true,
        validateStatus: (status) {
          return status != null && (status >= 200 && status < 400 || status == 302);
        },
      );

      print('DEBUG: Starting POST request to: $endpoint'); // Debug log

      // Make the request directly first
      try {
        final response = await dio.fetch(options);
        print('DEBUG: Initial response received: ${response.statusCode}'); // Debug log

        // Handle redirect responses (status code 302)
        if (response.statusCode == 302) {
          final redirectUrl = getRedirectUrl(response);
          if (redirectUrl != null) {
            print('DEBUG: Following redirect to: $redirectUrl'); // Debug log

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
            error: ServiceError(
                code: '${response.statusCode}',
                message: 'Unexpected response status code: ${response.statusCode}, '
                    'uri: ${response.requestOptions.uri}, data:${response.data as T}'
            )
        );
      } catch (error) {
        print('DEBUG: Error during direct request: $error'); // Debug log

        // If direct request fails, try queue-based rate limiting
        print('DEBUG: Falling back to rate-limited queue'); // Debug log

        _requestQueue.add(_QueuedRequest(options, completer));

        if (!_isProcessing) {
          _processQueue();
        }

        _timer ??= Timer.periodic(_interval, (timer) {
          _requestCount = 0;
          if (_requestQueue.isNotEmpty && !_isProcessing) {
            _processQueue();
          }
        });

        final queuedResponse = await completer.future;
        print('DEBUG: Queued response received: ${queuedResponse.statusCode}'); // Debug log

        if (queuedResponse.statusCode! >= 200 && queuedResponse.statusCode! < 300) {
          return SDKServiceResponse.success(data: queuedResponse.data as T);
        }

        return SDKServiceResponse.error(
            error: ServiceError(
                code: '${queuedResponse.statusCode}',
                message: 'Unexpected response status code: ${queuedResponse.statusCode}, '
                    'uri: ${queuedResponse.requestOptions.uri}, data:${queuedResponse.data as T}'
            )
        );
      }
    } catch (e) {
      print('DEBUG: Final error catch: $e'); // Debug log
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
      final completer = Completer<Response>();

      final options = RequestOptions(
        path: endpoint,
        method: 'PUT',
        data: data,
        queryParameters: queryParameters,
        baseUrl: dio.options.baseUrl,
        headers: {...dio.options.headers, ...?headers},
        followRedirects: true,
        validateStatus: (status) {
          return status != null && (status >= 200 && status < 400 || status == 302);
        },
      );

      print('Queueing PUT request to: $endpoint');

      _requestQueue.add(_QueuedRequest(options, completer));

      if (!_isProcessing) {
        _processQueue();
      }

      _timer ??= Timer.periodic(_interval, (timer) {
        _requestCount = 0;
        if (_requestQueue.isNotEmpty && !_isProcessing) {
          _processQueue();
        }
      });

      final response = await completer.future;

      // Handle redirect responses (status code 302)
      if (response.statusCode == 302) {
        final redirectUrl = getRedirectUrl(response);
        if (redirectUrl != null) {
          final redirectCompleter = Completer<Response>();
          final redirectOptions = RequestOptions(
            path: redirectUrl,
            method: 'GET',
            headers: headers,
            baseUrl: '',
            validateStatus: (status) => status != null && status >= 200 && status < 300,
          );

          _requestQueue.add(_QueuedRequest(redirectOptions, redirectCompleter));
          final redirectResponse = await redirectCompleter.future;
          return SDKServiceResponse.success(data: redirectResponse.data as T);
        }
      }

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SDKServiceResponse.success(data: response.data as T);
      }

      return SDKServiceResponse.error(
          error: ServiceError(
              code: '${response.statusCode}',
              message: 'Unexpected response status code: ${response.statusCode}, '
                  'uri: ${response.requestOptions.uri}, data:${response.data as T}'
          )
      );
    } catch (e) {
      return SDKServiceResponse.error(error: _handleError(e));
    }
  }

  Future<SDKServiceResponse<T>> delete<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final completer = Completer<Response>();

      final options = RequestOptions(
        path: endpoint,
        method: 'DELETE',
        queryParameters: queryParameters,
        baseUrl: dio.options.baseUrl,
        headers: {...dio.options.headers, ...?headers},
      );

      print('Queueing DELETE request to: $endpoint');

      _requestQueue.add(_QueuedRequest(options, completer));

      if (!_isProcessing) {
        _processQueue();
      }

      _timer ??= Timer.periodic(_interval, (timer) {
        _requestCount = 0;
        if (_requestQueue.isNotEmpty && !_isProcessing) {
          _processQueue();
        }
      });

      final response = await completer.future;
      return SDKServiceResponse.success(data: response.data as T);
    } catch (e) {
      return SDKServiceResponse.error(error: _handleError(e));
    }
  }

// Keep your existing helper methods
  String? getRedirectUrl(Response response) {
    String? location = response.headers.value('location') ??
        response.headers.value('Location');

    if (location != null && !location.startsWith('http')) {
      final baseUrl = response.requestOptions.baseUrl;
      location = Uri.parse(baseUrl).resolve(location).toString();
    }

    return location;
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

class _QueuedRequest {
  final RequestOptions options;
  final Completer<Response> completer;

  _QueuedRequest(this.options, this.completer);
}*/

class SDKServiceRequest {
  // late final Dio dio;
  late final Dio dio = Dio(); // Ensure dio is initialized
  late final SoupMarketConfig _config;
  // Singleton pattern
  static final SDKServiceRequest _instance = SDKServiceRequest._internal();
  factory SDKServiceRequest() => _instance;

  Timer? _timer;
  int _requestLimit = 3;
  int _requestCount = 0;
  Duration _interval = Duration(seconds: 1);
  bool _isProcessing = false; // Flag to prevent concurrent queue processing

  bool enableCaching = false;
  CacheOptions? cacheOptions;

  SDKServiceRequest._internal();
  // {
  //   //Initialize with throttler
    // dio.interceptors.add(
    //   SDKDioThrottler(
    //     interval: const Duration(milliseconds: 500),  // Customize interval
    //     onThrottled: (request, time) {
    //       print('Request throttled until: $time');  // Optional logging
    //     },
    //     shouldThrottle: (request) {
    //       //Optional: customize which requests to throttle
          // return true;  // Throttle all requests by default
        // },
      // ),
    // );
  // }

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

    // dio.interceptors.add(
    //   SDKDioThrottler(
    //     interval: const Duration(milliseconds: 500),
    //     onThrottled: (request, time) {
    //       print('Request throttled until: $time');
    //     },
    //   ),
    // );
    dio.interceptors.add(
      SDKRateLimiter(
        consumerId: apiKey,
        onRateLimited: (request, time) {
          print('Request rate limited until: $time for endpoint: ${request.path}');
        },
      ),
    );

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

    /*// rate-limiting interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final completer = Completer<Response>();

          _requestQueue.add(_QueuedRequest(options, completer));

          // Start processing queue if not already processing
          if (!_isProcessing) {
            _processQueue();
          }

          try {
            final response = await completer.future;
            handler.resolve(response);
          } catch (error) {
            handler.reject(error as DioException);
          }
        },
      ),
    );

    // Initialize the timer to reset the request count
    // Reset request count periodically
    _timer?.cancel();
    _timer = Timer.periodic(_interval, (timer) {
      _requestCount = 0;
      if (_requestQueue.isNotEmpty && !_isProcessing) {
        _processQueue();
      }
    });*/
  }

  String getBasicAuthToken(String apiKey, String apiSecret) {
    final credentials = '$apiKey:$apiSecret';
    final encodedCredentials = base64.encode(utf8.encode(credentials));
    return 'Basic $encodedCredentials';
  }

  /*Future<void> _processQueue() async {
    if (_isProcessing) return;
    _isProcessing = true;

    while (_requestQueue.isNotEmpty && _requestCount < _requestLimit) {
      final request = _requestQueue.removeFirst();
      _requestCount++;

      try {
        final response = await dio.fetch(request.options);
        request.completer.complete(response);
      } catch (error) {
        request.completer.completeError(error);
      }
    }

    _isProcessing = false;
  }*/

  // Cleanup method
  // void dispose() {
  //   _timer?.cancel();
  //   _timer = null;
  //   _requestCount = 0;
  //   _isProcessing = false;
  // }

  Future<SDKServiceResponse<T>> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      // if (enableCaching) {
      //   final appDocDir = await getApplicationDocumentsDirectory();
      //
      //   cacheOptions = CacheOptions(
      //     store: BackupCacheStore(
      //       primary: MemCacheStore(maxSize: 50), // In-memory cache with max 50 items
      //       secondary: HiveCacheStore(appDocDir.path), // Persistent disk-based cache
      //     ),
      //     policy: CachePolicy.request,
      //     hitCacheOnErrorExcept: [401, 403],
      //     priority: CachePriority.normal,
      //     maxStale: const Duration(days: 7),
      //   );
      //   dio.interceptors.add(DioCacheInterceptor(options: cacheOptions!));
      // }
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

class SDKRateLimiter extends Interceptor {
  /// Maps endpoint to the time when next request is allowed
  final Map<String, DateTime> _nextAvailableByEndpoint = {};

  /// Lock for thread-safe operations
  final _lock = Lock();

  /// Time window size matching server (3 seconds)
  final Duration _windowSize = const Duration(seconds: 3);

  /// Optional consumer ID (if your app has multiple users)
  final String? consumerId;

  /// Callback for when a request is rate-limited
  final void Function(RequestOptions req, DateTime until)? onRateLimited;

  SDKRateLimiter({
    this.consumerId,
    this.onRateLimited,
  });

  /// Extract endpoint from request path
  String _getEndpointKey(RequestOptions options) {
    // Extract the base endpoint path from the full URL
    // You may need to customize this based on your API structure
    final uri = Uri.parse(options.path);
    final segments = uri.pathSegments;
    return segments.isNotEmpty ? segments.first : options.path;
  }

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final endpoint = _getEndpointKey(options);
    final now = DateTime.now();

    try {
      final DateTime? scheduledTime = await _lock.synchronized(() {
        final nextAvailable = _nextAvailableByEndpoint[endpoint] ?? now;

        if (now.isBefore(nextAvailable)) {
          // Need to rate limit this request
          final scheduledTime = nextAvailable;
          // Update next available slot
          _nextAvailableByEndpoint[endpoint] = nextAvailable.add(_windowSize);
          return scheduledTime;
        } else {
          // Can execute immediately
          _nextAvailableByEndpoint[endpoint] = now.add(_windowSize);
          return null;
        }
      });

      if (scheduledTime != null) {
        // Notify if request is rate limited
        onRateLimited?.call(options, scheduledTime);

        // Delay the request
        await Future.delayed(scheduledTime.difference(now));
      }
      // Process the request
      handler.next(options);
    } catch (error) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: error,
          message: 'Error in rate limiter: $error',
        ),
      );
    }
  }
}