import 'dart:io';

import 'package:dio/dio.dart';

import '../core.dart';

/// Helper methods for [DioError] error.
extension DioErrorExtension on DioError {
  /// Will return true when a request is cancelled.
  bool get isCancelledError => type == DioErrorType.cancel;

  /// Will return true when there is no internet connection.
  bool get isConnectionError {
    return type == DioErrorType.other && error is SocketException;
  }

  /// Will return true when [FormatException] is thrown when parsing a response.
  bool get isFormatError {
    return type == DioErrorType.other && error is FormatException;
  }

  /// Will return true when response is returned with status code between
  /// >= 400 and < 500.
  bool get isResponseError => type == DioErrorType.response;

  /// Will return true when a request is timeout while connecting, sending, or
  /// receiving a content.
  bool get isTimeoutError {
    return type == DioErrorType.connectTimeout ||
        type == DioErrorType.sendTimeout ||
        type == DioErrorType.receiveTimeout;
  }

  /// Returns [NetworkException] if the error [type] is not
  /// [DioErrorType.response]. Otherwise, throws [UnexpectedError].
  ///
  /// **Note:** Only use this method if you are sure the request is not going to
  /// result with a response error, which is basically any response with status
  /// code of 400 < 500.
  NetworkException<T> toNetWorkErrorOrThrow<T>() {
    return toNetWorkError(onResponse: (res) => throw UnexpectedError(res));
  }

  /// Returns [NetworkException] if the error [type] is not
  /// [DioErrorType.response]. Otherwise, it will return the result of
  /// [onResponse] callback.
  NetworkException<T> toNetWorkError<T>({
    required NetworkException<T> Function(Response response) onResponse,
  }) {
    switch (type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return const NetworkException.timeout();
      case DioErrorType.response:
        final statusCode = response!.statusCode;
        if (statusCode != null && statusCode >= 500) {
          return const NetworkException.server();
        } else {
          return onResponse(response!);
        }
      case DioErrorType.cancel:
        return const NetworkException.cancelled();
      case DioErrorType.other:
        if (isConnectionError) {
          return const NetworkException.connection();
        } else if (isFormatError) {
          return const NetworkException.format();
        } else {
          return const NetworkException.server();
        }
    }
  }
}
