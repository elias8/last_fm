import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

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
        'should emit [ ArtistSearchLoading, ArtistSearchLoaded ] when response '
        'is returned',
        setUp: () => when(() => artistRepository.findByName(text))
            .thenAnswer((_) async => right(artists)),
        build: () => artistSearchBloc,
        act: (bloc) => bloc.add(const ArtistSearchTextChanged(text)),
        wait: const Duration(milliseconds: 300),
        expect: () => [
          const ArtistSearchLoading(),
          ArtistSearchLoaded(right(artists)),
        ],
      );

      blocTest<ArtistSearchBloc, ArtistSearchState>(
        'should emit [ ArtistSearchLoaded ] with empty result when search term '
        'is empty',
        build: () => artistSearchBloc,
        act: (bloc) => bloc.add(const ArtistSearchTextChanged('')),
        wait: const Duration(milliseconds: 300),
        expect: () => const [ArtistSearchLoaded(Right([]))],
      );
    });
  });
}

class _FakeArtist extends Fake implements Artist {}

class _MockArtistRepository extends Mock implements ArtistRepository {}
