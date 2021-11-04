import 'package:flutter/foundation.dart';

import 'app_exception.dart';

/// Generic network exception.
///
/// Helps us to propagate network exceptions from a remote source layer to any
/// layer above. By using [ NetworkException.custom ] we can pass any custom
/// error [T] such as a validation error returned from an API.
@immutable
abstract class NetworkException<T>
    with _HelperMixin<T>
    implements AppException {
  /// It occurs when a request is cancelled.
  const factory NetworkException.cancelled() = _RequestCancelledException<T>;

  /// It occurs when there is no internet connection.
  const factory NetworkException.connection() = _InternetConnectionException<T>;

  /// It occurs when error is returned from an API. For example, 404 response
  /// with custom error data.
  const factory NetworkException.custom(T error) = _NetworkCustomException<T>;

  /// It occurs when [FormatException] or [TypeError] is thrown.
  const factory NetworkException.format() = _NetworkFormatException<T>;

  /// It occurs when a server error (a response with a status code of >= 500)
  /// is returned from an API.
  const factory NetworkException.server() = _ServerException<T>;

  /// It occurs when opening, sending, or receiving data from/to an API is
  /// timeout.
  const factory NetworkException.timeout() = _NetworkTimeoutException<T>;

  /// We don't want any other class to extend this class.
  const NetworkException._();

  @override
  String toString() {
    if (this is _NetworkCustomException<T>) {
      final error = (this as _NetworkCustomException<T>).error;
      return '$runtimeType($error)';
    }
    return '$runtimeType()';
  }
}

/// [NetworkException] helper mixin methods and getters.
mixin _HelperMixin<T> {
  /// Returns true if the error is [NetworkException.cancelled].
  bool get isCancellationError => this is _RequestCancelledException<T>;

  /// Returns true if the error is [NetworkException.connection].
  bool get isConnectionError => this is _InternetConnectionException<T>;

  /// Returns true if the error is [NetworkException.custom].
  bool get isCustomError => this is _NetworkCustomException<T>;

  /// Returns true if the error is [NetworkException.format].
  bool get isFormatException => this is _NetworkFormatException<T>;

  /// Returns true if the error is [NetworkException.server].
  bool get isServerError => this is _ServerException<T>;

  /// Returns true if the error is [NetworkException.timeout].
  bool get isTimeoutError => this is _NetworkTimeoutException<T>;

  /// Returns a short name of the error type.
  String get name {
    if (isCancellationError) {
      return 'cancelled';
    } else if (isConnectionError) {
      return 'connection';
    } else if (isCustomError) {
      return 'custom';
    } else if (isFormatException) {
      return 'format';
    } else if (isServerError) {
      return 'server';
    } else if (isTimeoutError) {
      return 'timeout';
    } else {
      throw FallThroughError();
    }
  }
}

class _InternetConnectionException<T> extends NetworkException<T> {
  const _InternetConnectionException() : super._();
}

class _NetworkCustomException<T> extends NetworkException<T> {
  final T error;

  const _NetworkCustomException(this.error) : super._();

  @override
  int get hashCode => error.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _NetworkCustomException<T> &&
          runtimeType == other.runtimeType &&
          error == other.error;
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
