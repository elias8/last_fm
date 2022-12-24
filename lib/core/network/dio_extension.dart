import 'dart:io';

import 'package:dio/dio.dart';
import 'package:networkx/networkx.dart';

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

  /// Returns [NetworkError] if the error [type] is not [DioErrorType.response].
  /// Otherwise, if the [onResponseError] callback is not null, it will return
  /// the result of callback. However, it the callback is null, it will return
  /// [NetworkError.unhandled] error.
  NetworkError<T> toNetWorkError<T>({
    NetworkError<T>? Function(Response response)? onResponseError,
  }) {
    switch (type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return NetworkError<T>.timeout();
      case DioErrorType.response:
        if (response != null) {
          final statusCode = response!.statusCode;
          if (statusCode != null && statusCode >= 500) {
            return NetworkError<T>.server();
          } else if (onResponseError != null) {
            final error = onResponseError(response!);
            if (error != null) return error;
          }
        }
        return NetworkError<T>.unhandled();
      case DioErrorType.cancel:
        return NetworkError<T>.cancelled();
      case DioErrorType.other:
        if (isConnectionError) {
          return NetworkError<T>.connection();
        } else if (isFormatError) {
          return NetworkError<T>.format();
        } else {
          return NetworkError<T>.server();
        }
    }
  }

  /// Returns [NetworkError] if the error [type] is not
  /// [DioErrorType.response]. Otherwise, throws [UnexpectedNetworkError].
  ///
  /// **Note:** Only use this method if you are sure the request is not going to
  /// result with a response error, which is basically any response with status
  /// code of 400 < 500.
  NetworkError<T> toNetWorkErrorOrThrow<T>() {
    return toNetWorkError(
      onResponseError: (it) => throw UnexpectedNetworkError(it),
    );
  }
}
