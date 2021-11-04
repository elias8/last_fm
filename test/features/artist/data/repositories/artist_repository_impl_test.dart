import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$ArtistRepositoryImpl', () {
    late ArtistRemoteSource artistRemoteSource;
    late ArtistRepositoryImpl artistRepositoryImpl;

    setUp(() {
      artistRemoteSource = _MockArtistRemoteSource();
      artistRepositoryImpl = ArtistRepositoryImpl(artistRemoteSource);
    });

    group('findByName', () {
      test('should return list of Artist when success', () async {
        const artistName = 'name';
        when(() => artistRemoteSource.findByName(artistName))
            .thenAnswer((_) async => right([]));

        final response = await artistRepositoryImpl.findByName(artistName);

        expect(response.isRight(), isTrue);
      });
    });
  });
}

class _MockArtistRemoteSource extends Mock implements ArtistRemoteSource {}
