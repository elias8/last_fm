import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/helpers.dart';
import 'artist_remote_source_fixture.dart';

void main() {
  group('$ArtistRemoteSourceImpl', () {
    late Dio dio;
    late ArtistRemoteSourceImpl artistRemoteSourceImpl;

    setUp(() {
      dio = MockDio();
      artistRemoteSourceImpl = ArtistRemoteSourceImpl(dio);
    });

    group('findByName', () {
      const artistName = 'name';
      const query = {'method': 'artist.search', 'artist': artistName};

      test('should return list of ArtistDto when success', () async {
        when(() => dio.get<Map>('/', queryParameters: query))
            .thenAnswer((_) async => FakeResponse(data: artistSearchResult));

        final response = await artistRemoteSourceImpl.findByName(artistName);

        expect(response.isRight(), isTrue);
      });

      test('should return NetworkException when request is not successful',
          () async {
        when(() => dio.get<Map>('/', queryParameters: query))
            .thenThrow(FakeDioError(DioErrorType.cancel));

        final response = await artistRemoteSourceImpl.findByName(artistName);

        expect(response.isLeft(), isTrue);
      });
    });
  });
}
