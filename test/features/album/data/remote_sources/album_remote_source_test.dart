import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/core/core.dart';
import 'package:last_fm/features/album/album.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/dio_helpers.dart';
import 'album_remote_source_fixture.dart';

void main() {
  group('$AlbumRemoteSourceImpl', () {
    late Dio dio;
    late AlbumRemoteSourceImpl albumRemoteSourceImpl;

    setUp(() {
      dio = MockDio();
      albumRemoteSourceImpl = AlbumRemoteSourceImpl(dio);
    });

    group('findAlbumDetail', () {
      const query = AlbumDetailQueryDto(album: 'Starboy', artist: 'The Weeknd');
      final queryParam = {
        'album': query.album,
        'artist': query.artist,
        'method': 'album.getinfo',
      };

      test('should return album when success', () async {
        when(() => dio.get('/', queryParameters: queryParam))
            .thenAnswer((_) async => FakeResponse.success(albumDetailResponse));

        final response = await albumRemoteSourceImpl.findAlbumDetail(query);

        expect(response.isRight(), isTrue);
      });

      test('should return NetworkException when album is not found', () async {
        when(() => dio.get('/', queryParameters: queryParam)).thenAnswer(
          (_) => throw FakeDioError.response(
            FakeResponse.notFound(albumNotFoundResponse),
          ),
        );

        final response = await albumRemoteSourceImpl.findAlbumDetail(query);

        expect(
          response,
          left(const NetworkException.api(AlbumDetailError.albumNotFound)),
        );
      });
    });

    group('findTopAlbumsByArtistName', () {
      const artistName = 'name';
      const query = {'method': 'artist.gettopalbums', 'artist': artistName};

      test('should return list of albums when success', () async {
        when(() => dio.get<Map>('/', queryParameters: query))
            .thenAnswer((_) async => FakeResponse.success(topAlbumsResponse));

        final response =
            await albumRemoteSourceImpl.findTopAlbumsByArtistName(artistName);

        expect(response.isRight(), isTrue);
      });

      test(
          'should return NetworkException when artist not found error is '
          'returned', () async {
        when(() => dio.get<Map>('/', queryParameters: query))
            .thenAnswer((_) async => FakeResponse.success(artistNotFound));

        final response =
            await albumRemoteSourceImpl.findTopAlbumsByArtistName(artistName);

        expect(
          response,
          left(const NetworkException.api(TopAlbumsError.artistNotFound)),
        );
      });

      test('should return NetworkException when request timed out', () async {
        when(() => dio.get<Map>('/', queryParameters: query))
            .thenThrow(FakeDioError(DioErrorType.sendTimeout));

        final response =
            await albumRemoteSourceImpl.findTopAlbumsByArtistName(artistName);

        expect(response.isLeft(), isTrue);
      });
    });
  });
}
