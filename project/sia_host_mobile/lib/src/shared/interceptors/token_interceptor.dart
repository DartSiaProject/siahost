import 'package:dio/dio.dart';

class TokenInterceptor extends QueuedInterceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final accessToken = sl.get<LocalDbService>().getAccessToken();
    // final reqUrl = options.uri.path;

    // if (accessToken != null && reqUrl != '/auth/refresh') {
    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // if (err.type == DioExceptionType.badResponse &&
    //     (err.response?.statusCode == 401)) {
    //   final options = err.requestOptions;
    //   try {
    //     final refreshToken = sl.get<LocalDbService>().getRefreshToken();
    //     if (refreshToken == null) {
    //       return handler.reject(err);
    //     }

    //     String? newToken;
    //     try {
    //       newToken = await sl.get<AuthRepository>().refreshToken(refreshToken);
    //     } catch (e) {
    //       log('$e');
    //     }

    //     if (newToken != null) {
    //       try {
    //         options.headers['Authorization'] = 'Bearer $newToken';
    //         final response = await sl.get<Dio>().fetch<dynamic>(options);

    //         return handler.resolve(response);
    //       } catch (e) {
    //         log('$e');
    //         return handler.reject(err);
    //       }
    //     }
    //     return handler.reject(err);
    //   } catch (e) {
    //     return handler.reject(err);
    //   }
    // }

    return handler.reject(err);
  }
}
