import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/core/core.dart';

void main() {
  group('$NetworkException', () {
    test('should return true when type matches', () {
      expect(const NetworkException.cancelled().isCancellationError, isTrue);
      expect(const NetworkException.connection().isConnectionError, isTrue);
      expect(const NetworkException.custom(0).isCustomError, isTrue);
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
        const NetworkException.custom('message').toString(),
        '_NetworkCustomException<String>(message)',
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
        const NetworkException.custom('message') ==
            const NetworkException.connection(),
        isFalse,
      );
      expect(
        const NetworkException.custom('message') ==
            const NetworkException.custom('other'),
        isFalse,
      );
      expect(
        const NetworkException.custom('message') ==
            const NetworkException.custom('message'),
        isTrue,
      );
      expect(
        // ignore: prefer_const_constructors
        NetworkException.custom('message') ==
            // ignore: prefer_const_constructors
            NetworkException.custom('message'),
        isTrue,
      );
      expect(const NetworkException.custom('message').hashCode,
          'message'.hashCode);
    });

    test('should key return correct value', () {
      expect(const NetworkException.cancelled().key, 'cancelled');
      expect(const NetworkException.connection().key, 'connection');
      expect(const NetworkException.custom('').key, 'custom');
      expect(const NetworkException.format().key, 'format');
      expect(const NetworkException.server().key, 'server');
      expect(const NetworkException.timeout().key, 'timeout');
    });
  });
}
