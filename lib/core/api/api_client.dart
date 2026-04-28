import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static late Dio _dio;
  
  static void init(String baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: false,
      maxWidth: 100,
    ));
    
    // Add auth interceptor here
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Example: options.headers['authorization'] = 'Bearer ${getStringAsync(apiAuthToken)}';
        handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.statusCode == 401) {
          // Handle Global Logout
        }
        handler.next(response);
      },
    ));
  }

  static Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  static Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }
}
