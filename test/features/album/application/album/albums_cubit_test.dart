import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/features/album/album.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumsCubit', () {
    late AlbumsCubit albumsCubit;
    late AlbumRepository albumRepository;

    setUp(() {
      albumRepository = _MockAlbumRepository();
      albumsCubit = AlbumsCubit(albumRepository);
    });

    tearDown(() => albumsCubit.close());

    group('deleteAllAlbums', () {
      blocTest<AlbumsCubit, AlbumsState>(
        'should emit [ AllAlbumsLoaded ] when all albums are deleted',
        setUp: () => when(albumRepository.deleteAllAlbums)
            .thenAnswer((_) async => Future.value()),
        build: () => albumsCubit,
        act: (cubit) => cubit.deleteAllAlbums(),
        expect: () => const [AllAlbumsLoaded([])],
      );
    });

    group('loadAllAlbums', () {
      blocTest<AlbumsCubit, AlbumsState>(
        'should emit [ AlbumsLoading, AllAlbumsLoaded ] when all albums are '
        'loaded',
        setUp: () => when(albumRepository.findAll).thenAnswer((_) async => []),
        build: () => albumsCubit,
        act: (cubit) => cubit.loadAllAlbums(),
        expect: () => const [AlbumsLoading(), AllAlbumsLoaded([])],
      );
    });

    group('loadTopAlbumsByArtistName', () {
      const artistName = 'name';

      blocTest<AlbumsCubit, AlbumsState>(
        'should emit [ AlbumsLoading, TopAlbumsLoaded ] when top albums are '
        'loaded',
        setUp: () {
          when(() => albumRepository.findTopAlbumsByArtistName(artistName))
              .thenAnswer((_) async => const Right([]));
        },
        build: () => albumsCubit,
        act: (cubit) => cubit.loadTopAlbumsByArtistName(artistName),
        expect: () => const [AlbumsLoading(), TopAlbumsLoaded(Right([]))],
      );
    });

    group('watchAllAlbums', () {
      final albums = <AlbumDetail>[_FakeAlbumDetail()];
      blocTest<AlbumsCubit, AlbumsState>(
        'should emit [ AlbumsLoading, AllAlbumsLoaded, AllAlbumsLoaded ] '
        'when all albums are loaded and a new event is emitted',
        setUp: () {
          when(albumRepository.findAll).thenAnswer((_) async => []);
          when(albumRepository.watchAllAlbums)
              .thenAnswer((_) => Stream.value(albums));
        },
        build: () => albumsCubit,
        act: (cubit) => cubit.watchAllAlbums(),
        expect: () => [
          const AlbumsLoading(),
          const AllAlbumsLoaded([]),
          AllAlbumsLoaded(albums),
        ],
      );
    });
  });
}

class _FakeAlbumDetail extends Fake implements AlbumDetail {}

class _MockAlbumRepository extends Mock implements AlbumRepository {}
