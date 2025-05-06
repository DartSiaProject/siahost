import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class DartSiaException extends Equatable implements Exception {
  const DartSiaException(
    String? message, {
    required this.error,
    this.code = 0,
  }) : message = message ?? '';

  /// Get error type from [DioException],
  /// [SocketException] and throw [DartSiaException]
  /// @param {dynamic} error
  /// @throws {DartSiaException}
  factory DartSiaException.handleError(
    dynamic error,
  ) {
    Logger().e(error);
    if (error is DartSiaException) return error;

    var code = 0;
    String? msg;
    ResponseStatus err;
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          err = ResponseStatus.cancelled;
        case DioExceptionType.connectionTimeout:
          err = ResponseStatus.connectionTimeout;
        case DioExceptionType.connectionError:
          err = ResponseStatus.noInternet;
        case DioExceptionType.receiveTimeout:
          err = ResponseStatus.receiveTimeout;
        case DioExceptionType.sendTimeout:
          err = ResponseStatus.sendTimeout;
        case DioExceptionType.badCertificate:
          err = ResponseStatus.invalidCertificate;
        case DioExceptionType.unknown:
          err = ResponseStatus.unknown;
        case DioExceptionType.badResponse:
          final response = error.response;
          if (response == null) {
            err = ResponseStatus.noInternet;
            msg = error.message;
            break;
          }

          final errData = response.data;
          if (errData is Map<String, dynamic>) {
            final dynamic dataMsg = errData['message'];
            if (dataMsg is String && dataMsg.isNotEmpty) {
              msg = dataMsg;
            } else if (dataMsg is List) {
              msg = dataMsg.join('\n');
            } else {
              msg = errData.toString();
            }
          } else {
            msg = errData.toString();
          }

          final statusCode = error.response?.statusCode ?? 0;
          code = statusCode;
          if (statusCode == 401) {
            err = ResponseStatus.unAuthorized;
          } else if (statusCode == 403) {
            err = ResponseStatus.forbidden;
          } else if (statusCode == 400) {
            err = ResponseStatus.badRequest;
          } else if (statusCode == 404) {
            err = ResponseStatus.notFound;
          } else if (statusCode == 409) {
            err = ResponseStatus.conflict;
          } else if (statusCode == 418) {
            err = ResponseStatus.badManip;
          } else if (statusCode == 422) {
            err = ResponseStatus.unprocessibleEntity;
          } else {
            err = ResponseStatus.internalServerError;
          }
      }
    } else if (error is SocketException) {
      err = ResponseStatus.noInternet;
    } else if (error == ResponseStatus.provider) {
      err = ResponseStatus.other;
    } else {
      msg = error.toString();
      err = ResponseStatus.unknown;
    }

    return DartSiaException(msg, error: err, code: code);
  }

  final String message;
  final int code;
  final ResponseStatus error;

  @override
  String toString() {
    return message;
  }

  @override
  List<Object?> get props => [message, code, error];
}
