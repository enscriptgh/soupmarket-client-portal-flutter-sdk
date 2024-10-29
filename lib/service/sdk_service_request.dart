// Main SDK Class
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:soupmarket_sdk/config/soup_market_config.dart';
import 'package:soupmarket_sdk/service/sdk_service_response.dart';
import 'package:soupmarket_sdk/utils/api_exception.dart';

class SDKServiceRequest {
  late final Dio _dio;
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
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: timeout),
      receiveTimeout: Duration(milliseconds: timeout),
      headers: {
        'Authorization': basicAuthCredentials,
        'Content-Type': 'application/json',
        ...?headers,
      },
    );

    // Add interceptors
    _dio.interceptors.add(LogInterceptor(
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
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
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
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return SDKServiceResponse.success(data: response.data as T);
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
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return SDKServiceResponse.success(data: response.data as T);
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
      final response = await _dio.delete(
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