import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/core/core.dart';

void main() {
  group('$NetworkException', () {
    test('should return true when type matches', () {
      expect(const NetworkException.cancelled().isCancellationError, isTrue);
      expect(const NetworkException.connection().isConnectionError, isTrue);
      expect(const NetworkException.api(0).isApiError, isTrue);
      expect(const NetworkException.server().isServerError, isTrue);
      expect(const NetworkException.timeout().isTimeoutError, isTrue);
      expect(const NetworkException.format().isFormatException, isTrue);
    });

    test('should toString return correct result', () {
      expect(
        const NetworkException<int>.cancelled().toString(),
        '_RequestCancelledException<int>()',
      );
      expect(
        const NetworkException<String>.connection().toString(),
        '_InternetConnectionException<String>()',
      );
      expect(
        const NetworkException.api('message').toString(),
        '_ApiException<String>(message)',
      );
      expect(
        const NetworkException.server().toString(),
        '_ServerException<dynamic>()',
      );
      expect(
        const NetworkException.timeout().toString(),
        '_NetworkTimeoutException<dynamic>()',
      );
      expect(
        const NetworkException.format().toString(),
        '_NetworkFormatException<dynamic>()',
      );
    });

    test('should == operator return true when only two errors have equal value',
        () {
      expect(
        const NetworkException.cancelled() ==
            const NetworkException.cancelled(),
        isTrue,
      );
      expect(
        const NetworkException.cancelled() ==
            const NetworkException.connection(),
        isFalse,
      );
      expect(
        const NetworkException.api('message') ==
            const NetworkException.connection(),
        isFalse,
      );
      expect(
        const NetworkException.api('message') ==
            const NetworkException.api('other'),
        isFalse,
      );
      expect(
        const NetworkException.api('message') ==
            const NetworkException.api('message'),
        isTrue,
      );
      expect(
        // ignore: prefer_const_constructors
        NetworkException.api('message') ==
            // ignore: prefer_const_constructors
            NetworkException.api('message'),
        isTrue,
      );
      expect(
          const NetworkException.api('message').hashCode, 'message'.hashCode);
    });

    test('should name return correct value', () {
      expect(const NetworkException.api('').name, 'api');
      expect(const NetworkException.cancelled().name, 'cancelled');
      expect(const NetworkException.connection().name, 'connection');
      expect(const NetworkException.format().name, 'format');
      expect(const NetworkException.server().name, 'server');
      expect(const NetworkException.timeout().name, 'timeout');
    });
  });
}
