import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:soupmarket_sdk/soupmarket_sdk.dart';

/*TODO*/
// I will work on this later
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late SDKServiceRequest dioService;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    dioService = SDKServiceRequest();
    dioService.initialize(
      baseUrl: 'https://api.soupmarket.com',
      apiKey: 'test_api_key',
    );
  });
  group('DioService CRUD Operations', () {
    test('GET request should return successful response', () async {
      const path = '/test-endpoint';
      final responseData = {'message': 'Success'};

      dioAdapter.onGet(
        path,
            (server) => server.reply(200, responseData),
      );

      final response = await dioService.get<Map<String, dynamic>>(
        endpoint: path,
      );

      expect(response.isSuccess, true);
      expect(response.data, responseData);
      expect(response.error, null);
    });

    test('POST request should handle error response', () async {
      const path = '/auth/login';
      final errorResponse = {
        'message': 'Invalid credentials',
        'code': 'AUTH_ERROR'
      };

      dioAdapter.onPost(
        path,
            (server) => server.reply(401, errorResponse),
      );

      final response = await dioService.post<Map<String, dynamic>>(
        endpoint: path,
        // data: {
        //   'email': 'test@example.com',
        //   'password': 'wrong_password'
        // },
      );

      expect(response.isSuccess, false);
      expect(response.data, null);
      expect(response.error?.code, '401');
      expect(response.error?.message, 'Invalid credentials');
    });

    test('PUT request should update resource', () async {
      const path = '/users/1';
      final requestData = {'name': 'Updated Name'};
      final responseData = {'id': 1, 'name': 'Updated Name'};

      dioAdapter.onPut(
        path,
            (server) => server.reply(200, responseData),
      );

      final response = await dioService.put<Map<String, dynamic>>(
        endpoint: path,
        data: requestData,
      );

      expect(response.isSuccess, true);
      expect(response.data, responseData);
    });

    test('DELETE request should remove resource', () async {
      const path = '/users/1';

      dioAdapter.onDelete(
        path,
            (server) => server.reply(204, null),
      );

      final response = await dioService.delete<void>(
        endpoint: path,
      );

      expect(response.isSuccess, true);
    });
  });

  group('Error Handling', () {
    test('should handle timeout errors', () async {
      const path = '/slow-endpoint';

      dioAdapter.onGet(
        path,
            (server) => server.throws(
          408,
          DioError(
            requestOptions: RequestOptions(path: path),
            type: DioErrorType.connectionTimeout,
          ),
        ),
      );

      final response = await dioService.get<Map<String, dynamic>>(
        endpoint: path,
      );

      expect(response.isSuccess, false);
      expect(response.error?.code, 'TIMEOUT');
    });

    test('should handle network errors', () async {
      const path = '/network-error';

      dioAdapter.onGet(
        path,
            (server) => server.throws(
          500,
          DioError(
            requestOptions: RequestOptions(path: path),
            type: DioErrorType.connectionError,
          ),
        ),
      );

      final response = await dioService.get<Map<String, dynamic>>(
        endpoint: path,
      );

      expect(response.isSuccess, false);
      expect(response.error?.code, 'NETWORK_ERROR');
    });
  });
}

