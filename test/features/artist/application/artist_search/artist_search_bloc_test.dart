import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';
import 'package:networkx/networkx.dart';

void main() {
  group('$ArtistSearchBloc', () {
    late ArtistRepository artistRepository;
    late ArtistSearchBloc artistSearchBloc;

    setUp(() {
      artistRepository = _MockArtistRepository();
      artistSearchBloc = ArtistSearchBloc(artistRepository);
    });

    tearDown(() => artistSearchBloc.close());

    group('ArtistSearchTextChanged', () {
      const text = 'text';
      final artists = [_FakeArtist()];

      blocTest<ArtistSearchBloc, ArtistSearchState>(
        'should emit [ ArtistSearchLoading, ArtistSearchSuccess ] when list of '
        'artists is returned',
        setUp: () => when(() => artistRepository.findByName(text))
            .thenAnswer((_) async => right(artists)),
        build: () => artistSearchBloc,
        act: (bloc) => bloc.add(const ArtistSearchTextChanged(text)),
        wait: const Duration(milliseconds: 300),
        expect: () => [
          const ArtistSearchLoading(),
          ArtistSearchSuccess(artists),
        ],
      );

      blocTest<ArtistSearchBloc, ArtistSearchState>(
        'should emit [ ArtistSearchLoading, ArtistSearchSuccess ] when error is'
        ' returned',
        setUp: () => when(() => artistRepository.findByName(text))
            .thenAnswer((_) async => left(const NetworkError.format())),
        build: () => artistSearchBloc,
        act: (bloc) => bloc.add(const ArtistSearchTextChanged(text)),
        wait: const Duration(milliseconds: 300),
        expect: () => const [
          ArtistSearchLoading(),
          ArtistSearchFailure(NetworkError.format()),
        ],
      );

      blocTest<ArtistSearchBloc, ArtistSearchState>(
        'should emit [ ArtistSearchLoaded ] with empty result when search term '
        'is empty',
        build: () => artistSearchBloc,
        act: (bloc) => bloc.add(const ArtistSearchTextChanged('')),
        wait: const Duration(milliseconds: 300),
        expect: () => const [ArtistSearchSuccess([])],
      );
    });
  });
}

class _FakeArtist extends Fake implements Artist {}

class _MockArtistRepository extends Mock implements ArtistRepository {}
