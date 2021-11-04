import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:last_fm/features/album/album.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumLocalSourceImpl', () {
    late Box<AlbumDetailDto> albumBox;
    late AlbumLocalSourceImpl albumLocalSourceImpl;

    setUp(() {
      albumBox = _MockAlbumBox();
      albumLocalSourceImpl = AlbumLocalSourceImpl(albumBox);
    });

    group('deleteAlbum', () {
      test('should delete an album from the storage', () async {
        const query = AlbumDetailQueryDto(album: 'album', artist: 'artist');
        final id = '${query.artist}-${query.album}';
        when(() => albumBox.delete(id)).thenAnswer((_) => Future.value());

        await albumLocalSourceImpl.deleteAlbum(query);

        verify(() => albumBox.delete(id)).called(1);
      });
    });

    group('deleteAllAlbums', () {
      test('should delete all albums from the $Box', () async {
        when(albumBox.clear).thenAnswer((_) async => 0);

        await albumLocalSourceImpl.deleteAllAlbums();

        verify(albumBox.clear).called(1);
      });
    });

    group('findAlbumDetail', () {
      test('should find and return album by query', () async {
        const id = 'artist-album';
        final album = _FakeAlbumDetailDto();
        const query = AlbumDetailQueryDto(album: 'album', artist: 'artist');
        when(() => albumBox.get(id)).thenReturn(album);

        final response = await albumLocalSourceImpl.findAlbumDetail(query);

        expect(response, album);
      });
    });

    group('findAllAlbums', () {
      test('should return all stored albums', () async {
        final albums = <AlbumDetailDto>[_FakeAlbumDetailDto()];
        when(() => albumBox.values).thenReturn(albums);

        final response = await albumLocalSourceImpl.findAllAlbums();

        expect(response, albums);
      });
    });

    group('saveAlbum', () {
      test('should store an album to the storage', () async {
        const id = 'artist-album';
        final album = _MockAlbumDetailDto();
        when(() => album.name).thenReturn('album');
        when(() => album.artist).thenReturn('artist');

        when(() => albumBox.put(id, album)).thenAnswer((_) => Future.value());

        final response = await albumLocalSourceImpl.saveAlbum(album);

        expect(response, album);
        verify(() => albumBox.put(id, album)).called(1);
      });
    });

    group('watchAllAlbums', () {
      test('should emit list of albums when a new album is stored', () async {
        final albums = <AlbumDetailDto>[_FakeAlbumDetailDto()];
        final event = BoxEvent(0, _FakeAlbumDetailDto(), false);

        when(() => albumBox.values).thenReturn(albums);
        when(albumBox.watch).thenAnswer((_) => Stream.value(event));

        await expectLater(
          albumLocalSourceImpl.watchAllAlbums(),
          emitsInOrder([equals(albums), emitsDone]),
        );
      });
    });
  });
}

class _FakeAlbumDetailDto extends Fake implements AlbumDetailDto {}

class _MockAlbumBox extends Mock implements Box<AlbumDetailDto> {}

class _MockAlbumDetailDto extends Mock implements AlbumDetailDto {}
