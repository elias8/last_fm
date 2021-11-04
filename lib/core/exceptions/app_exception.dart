/// A marker interface implemented by all app exceptions.
abstract class AppException implements Exception {}

/// An exception should never happen but happened anyway because of wrong
/// assumptions/usage.
///
/// We should report this exception using a crash reporting tool if it occurs
/// in production to fix it ASAP as it is intentionally unhandled
/// programmatically, and we don't expect it to happen.
///
/// Extending [Error] class will let us automatically have a stack trace in the
/// first time the error is thrown by a `throw` expression.
class UnexpectedError extends Error implements AppException {
  /// Message describing the error.
  final Object? message;

  UnexpectedError([this.message]);

  @override
  String toString() {
    if (message != null) return Error.safeToString(message);
    return 'Unexpected error.';
  }
}
