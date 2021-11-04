import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/core/core.dart';
import 'package:last_fm/features/album/album.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumRepositoryImpl', () {
    late AlbumLocalSource albumLocalSource;
    late AlbumRemoteSource albumRemoteSource;
    late AlbumRepositoryImpl albumRepositoryImpl;

    setUp(() {
      albumLocalSource = _MockAlbumLocalSource();
      albumRemoteSource = _MockAlbumRemoteSource();
      albumRepositoryImpl = AlbumRepositoryImpl(
        albumLocalSource,
        albumRemoteSource,
      );
    });

    group('deleteAlbum', () {
      test('should delete AlbumDetail from the local source', () async {
        const query = AlbumDetailQuery(
          albumName: 'Divide',
          artistName: 'Ed Sheeran',
        );
        final queryDto = AlbumDetailQueryDto.fromModel(query);
        when(() => albumLocalSource.deleteAlbum(queryDto))
            .thenAnswer((_) => Future.value());

        await albumRepositoryImpl.deleteAlbum(query);

        verify(() => albumLocalSource.deleteAlbum(queryDto)).called(1);
      });
    });

    group('deleteAllAlbums', () {
      test('should delete all albums from the local source', () async {
        when(albumLocalSource.deleteAllAlbums)
            .thenAnswer((_) => Future.value());

        await albumRepositoryImpl.deleteAllAlbums();

        verify(albumLocalSource.deleteAllAlbums).called(1);
      });
    });

    group('findAlbumDetail', () {
      const query = AlbumDetailQuery(
        albumName: 'Starboy',
        artistName: 'Then Weeknd',
      );
      final queryDto = AlbumDetailQueryDto.fromModel(query);
      final albumDetail = _FakeAlbumDetail();
      final albumDetailDto = _FakeAlbumDetailDto(albumDetail);

      test('should return AlbumDetail from local source', () async {
        when(() => albumLocalSource.findAlbumDetail(queryDto))
            .thenAnswer((_) async => albumDetailDto);

        final response = await albumRepositoryImpl.findAlbumDetail(query);

        expect(response, right(albumDetail));
      });

      test(
          'should return AlbumDetail from the remote source when it is not '
          'found in local source', () async {
        when(() => albumLocalSource.findAlbumDetail(queryDto))
            .thenAnswer((_) async => null);
        when(() => albumRemoteSource.findAlbumDetail(queryDto))
            .thenAnswer((_) async => right(albumDetailDto));
        when(() => albumLocalSource.saveAlbum(albumDetailDto))
            .thenAnswer((_) async => albumDetailDto);

        final response = await albumRepositoryImpl.findAlbumDetail(query);

        expect(response, right(albumDetail));
      });

      test('should return NetworkException when error is returned', () async {
        const error = NetworkException<AlbumDetailError>.cancelled();
        when(() => albumLocalSource.findAlbumDetail(queryDto))
            .thenAnswer((_) async => null);
        when(() => albumRemoteSource.findAlbumDetail(queryDto))
            .thenAnswer((_) async => left(error));

        final response = await albumRepositoryImpl.findAlbumDetail(query);

        expect(response, left(error));
      });
    });

    group('findAll', () {
      test('should return AlbumDetails stored in local source', () async {
        final albums = <AlbumDetail>[_FakeAlbumDetail()];
        final storedAlbums = <AlbumDetailDto>[
          _FakeAlbumDetailDto(albums.first),
        ];
        when(albumLocalSource.findAllAlbums)
            .thenAnswer((_) async => storedAlbums);

        final response = await albumRepositoryImpl.findAll();

        expect(response, albums);
      });
    });

    group('findTopAlbumsByArtistName', () {
      const artistName = 'name';

      test('should return Albums when success', () async {
        final albums = <Album>[_FakeAlbum()];
        final dtos = <AlbumDto>[_FakeAlbumDto(albums.first)];
        when(() => albumRemoteSource.findTopAlbumsByArtistName(artistName))
            .thenAnswer((_) async => right(dtos));

        final response =
            await albumRepositoryImpl.findTopAlbumsByArtistName(artistName);

        expect(response.isRight(), isTrue);
      });
    });

    group('watchAllAlbums', () {
      test('should emit Albums by watching all albums in the local storage',
          () async {
        final albums = <AlbumDetail>[_FakeAlbumDetail()];
        final dtos = <AlbumDetailDto>[_FakeAlbumDetailDto(albums.first)];
        when(albumLocalSource.watchAllAlbums)
            .thenAnswer((_) => Stream.value(dtos));

        await expectLater(
          albumRepositoryImpl.watchAllAlbums(),
          emitsInOrder([albums, emitsDone]),
        );
      });
    });
  });
}

class _FakeAlbum extends Fake implements Album {}

class _FakeAlbumDetail extends Fake implements AlbumDetail {}

class _FakeAlbumDetailDto extends Fake implements AlbumDetailDto {
  final AlbumDetail album;

  _FakeAlbumDetailDto(this.album);

  @override
  AlbumDetail toEntity() => album;
}

class _FakeAlbumDto extends Fake implements AlbumDto {
  final Album album;

  _FakeAlbumDto(this.album);

  @override
  Album toEntity() => album;
}

class _MockAlbumLocalSource extends Mock implements AlbumLocalSource {}

class _MockAlbumRemoteSource extends Mock implements AlbumRemoteSource {}
