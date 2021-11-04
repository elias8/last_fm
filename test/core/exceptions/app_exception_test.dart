import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/core/core.dart';

void main() {
  group('$UnexpectedError', () {
    test('should toString return correct string', () {
      expect(UnexpectedError().toString(), 'Unexpected error.');
      expect(UnexpectedError('message').toString(), '"message"');
    });
  });
}
