import 'package:flutter/foundation.dart';

import 'app_exception.dart';

/// Generic network exception.
///
/// Helps us to propagate network exceptions from a remote source layer to any
/// layer above. By using [ NetworkException.api ] we can pass any custom
/// error [T] such as a validation error returned from a server.
@immutable
abstract class NetworkException<T>
    with _HelperMixin<T>
    implements AppException {
  /// It occurs when a request is successfully made to a server and an error is
  /// returned from the server. For example, 404 (not found) response.
  ///
  /// In general, this exception is for client side errors with status 4xx.
  /// Checkout https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#4xx_client_errors
  /// for more info.
  const factory NetworkException.api(T error) = _ApiException<T>;

  /// It occurs when a request is cancelled.
  const factory NetworkException.cancelled() = _RequestCancelledException<T>;

  /// It occurs when there is no internet connection.
  const factory NetworkException.connection() = _InternetConnectionException<T>;

  /// It occurs when [FormatException] or [TypeError] is thrown.
  const factory NetworkException.format() = _NetworkFormatException<T>;

  /// It occurs when a server error (a response with a status code of >= 500)
  /// is returned from the server.
  const factory NetworkException.server() = _ServerException<T>;

  /// It occurs when opening, sending, or receiving data from/to an server is
  /// timeout.
  const factory NetworkException.timeout() = _NetworkTimeoutException<T>;

  /// We don't want any other class to extend this class.
  const NetworkException._();

  @override
  String toString() {
    if (this is _ApiException<T>) {
      final error = (this as _ApiException<T>).error;
      return '$runtimeType($error)';
    }
    return '$runtimeType()';
  }
}

class _ApiException<T> extends NetworkException<T> {
  final T error;

  const _ApiException(this.error) : super._();

  @override
  int get hashCode => error.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ApiException<T> &&
          runtimeType == other.runtimeType &&
          error == other.error;
}

/// [NetworkException] helper mixin methods and getters.
mixin _HelperMixin<T> {
  /// Returns true if the error is [NetworkException.api].
  bool get isApiError => this is _ApiException<T>;

  /// Returns true if the error is [NetworkException.cancelled].
  bool get isCancellationError => this is _RequestCancelledException<T>;

  /// Returns true if the error is [NetworkException.connection].
  bool get isConnectionError => this is _InternetConnectionException<T>;

  /// Returns true if the error is [NetworkException.format].
  bool get isFormatException => this is _NetworkFormatException<T>;

  /// Returns true if the error is [NetworkException.server].
  bool get isServerError => this is _ServerException<T>;

  /// Returns true if the error is [NetworkException.timeout].
  bool get isTimeoutError => this is _NetworkTimeoutException<T>;

  /// Returns a short name of the error type.
  String get name {
    if (isApiError) return 'api';
    if (isCancellationError) return 'cancelled';
    if (isConnectionError) return 'connection';
    if (isFormatException) return 'format';
    if (isServerError) return 'server';
    if (isTimeoutError) return 'timeout';
    throw FallThroughError();
  }
}

class _InternetConnectionException<T> extends NetworkException<T> {
  const _InternetConnectionException() : super._();
}

class _NetworkFormatException<T> extends NetworkException<T> {
  const _NetworkFormatException() : super._();
}

class _NetworkTimeoutException<T> extends NetworkException<T> {
  const _NetworkTimeoutException() : super._();
}

class _RequestCancelledException<T> extends NetworkException<T> {
  const _RequestCancelledException() : super._();
}

class _ServerException<T> extends NetworkException<T> {
  const _ServerException() : super._();
}
