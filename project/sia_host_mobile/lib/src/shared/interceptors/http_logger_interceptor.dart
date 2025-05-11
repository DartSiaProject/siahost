import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class HttpLoggerInterceptor extends Interceptor {
  final appLogger = di.get<Logger>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      try {
        appLogger.d({
          'base_url': options.baseUrl,
          'url': options.path,
          'method': options.method,
          'params': options.queryParameters,
          'body': options.data,
          'headers': options.headers.toString(),
        });
      } catch (e) {
        appLogger.e(e.toString());
      }
    }

    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      try {
        appLogger.e(
          {
            'base_url': err.requestOptions.baseUrl,
            'path': err.requestOptions.path,
            'method': err.requestOptions.method,
            'data': err.requestOptions.data,
            'params': err.requestOptions.queryParameters,
            'message': '${err.response?.statusCode} ${err.error}',
            'original': err.message,
            'headers': err.requestOptions.headers.toString(),
          },
        );
      } catch (e) {
        appLogger.e(e.toString());
      }
    }

    return handler.next(err);
  }
}
