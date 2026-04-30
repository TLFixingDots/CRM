import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../local/shared_prefs.dart';
import '../local/session_service.dart';
import 'network_service.dart';

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
      onRequest: (options, handler) async {
        // Check for connectivity
        if (!await NetworkService.isConnected()) {
          return handler.reject(
            DioException(
              requestOptions: options,
              error: 'No Internet Connection',
              type: DioExceptionType.connectionError,
            ),
          );
        }

        final token = SharedPrefs.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.statusCode == 401) {
          // Handle Global Logout
          SessionService.onLogout();
        }
        handler.next(response);
      },
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          SessionService.onLogout();
        }
        handler.next(e);
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
