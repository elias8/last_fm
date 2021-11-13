import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/core/core.dart';
import 'package:last_fm/core/exceptions/app_exception.dart';

void main() {
  group('DioErrorExtension', () {
    test('should getters return true when error type matched', () {
      expect(_FakeDioError(DioErrorType.cancel).isCancelledError, isTrue);
      expect(_FakeDioError(DioErrorType.response).isResponseError, isTrue);
      expect(_FakeDioError(DioErrorType.sendTimeout).isTimeoutError, isTrue);
      expect(_FakeDioError(DioErrorType.receiveTimeout).isTimeoutError, isTrue);
      expect(_FakeDioError(DioErrorType.connectTimeout).isTimeoutError, isTrue);

      expect(
        _FakeDioError(DioErrorType.other, const SocketException(''))
            .isConnectionError,
        isTrue,
      );
      expect(
        _FakeDioError(DioErrorType.other, const FormatException())
            .isFormatError,
        isTrue,
      );
    });

    group('toNetworkError', () {
      test('should return a correct NetworkException type', () {
        NetworkException _throw(Response _) => throw UnimplementedError();
        expect(
          _FakeDioError(DioErrorType.connectTimeout)
              .toNetWorkError(onResponse: _throw)
              .isTimeoutError,
          isTrue,
        );
        expect(
          _FakeDioError(DioErrorType.sendTimeout)
              .toNetWorkError(onResponse: _throw)
              .isTimeoutError,
          isTrue,
        );
        expect(
          _FakeDioError(DioErrorType.receiveTimeout)
              .toNetWorkError(onResponse: _throw)
              .isTimeoutError,
          isTrue,
        );
        expect(
          _FakeDioError(DioErrorType.cancel)
              .toNetWorkError(onResponse: _throw)
              .isCancellationError,
          isTrue,
        );
        expect(
          _FakeDioError(DioErrorType.other, const SocketException(''))
              .toNetWorkError(onResponse: _throw)
              .isConnectionError,
          isTrue,
        );
        expect(
          _FakeDioError(DioErrorType.other, const FormatException())
              .toNetWorkError(onResponse: _throw)
              .isFormatException,
          isTrue,
        );
        expect(
          _FakeDioError(DioErrorType.other, const HttpException(''))
              .toNetWorkError(onResponse: _throw)
              .isServerError,
          isTrue,
        );
        expect(
          _FakeDioError(DioErrorType.response, null, _FakeResponse(404))
              .toNetWorkError(onResponse: (_) => const NetworkException.api(''))
              .isApiError,
          isTrue,
        );
        expect(
          _FakeDioError(DioErrorType.response, null, _FakeResponse(500))
              .toNetWorkError(onResponse: _throw)
              .isServerError,
          isTrue,
        );
      });
    });

    group('toNetWorkErrorOrThrow', () {
      test(
          'should throw UnexpectedError when error is type '
          '${DioErrorType.response}', () {
        expect(
          () => _FakeDioError(DioErrorType.response, null, _FakeResponse(404))
              .toNetWorkErrorOrThrow(),
          throwsA(isA<UnexpectedError>()),
        );
      });

      test(
          'should return NetworkException when error is type not '
          '${DioErrorType.response}', () {
        expect(
          _FakeDioError(DioErrorType.cancel)
              .toNetWorkErrorOrThrow()
              .isCancellationError,
          isTrue,
        );
      });
    });
  });
}

class _FakeDioError extends Fake implements DioError {
  final Exception? _error;
  final DioErrorType _type;
  final Response? _response;

  _FakeDioError(this._type, [this._error, this._response]);

  @override
  dynamic get error => _error;

  @override
  Response? get response => _response;

  @override
  DioErrorType get type => _type;
}

class _FakeResponse extends Fake implements Response {
  final int? _statusCode;

  _FakeResponse(this._statusCode);

  @override
  int? get statusCode => _statusCode;
}
