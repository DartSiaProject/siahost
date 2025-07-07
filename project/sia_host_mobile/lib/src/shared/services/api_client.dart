import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class ApiClient {
  late Dio _dio;

  @PostConstruct()
  void init() {
    _dio = Dio();
  }

  Dio get instance => _dio;
  Dio get i => _dio;

  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    final finalHeaders = headers ?? {};
    finalHeaders['accept'] = 'application/json';

    return _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: finalHeaders),
    );
  }

  Future<Response<dynamic>> post(String url, {dynamic data}) {
    return _dio.post(url, data: data);
  }

  Future<Response<dynamic>> put(String url, {dynamic data}) {
    return _dio.put(url, data: data);
  }

  Future<Response<dynamic>> delete(String url) {
    return _dio.delete(url);
  }
}
