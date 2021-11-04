import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$ArtistSearchCubit', () {
    late ArtistRepository artistRepository;
    late ArtistSearchCubit artistSearchCubit;

    setUp(() {
      artistRepository = _MockArtistRepository();
      artistSearchCubit = ArtistSearchCubit(artistRepository);
    });

    tearDown(() => artistSearchCubit.close());

    group('onTextChanged', () {
      const name = 'text';

      blocTest<ArtistSearchCubit, ArtistSearchState>(
        'should emit nothing when text is changed',
        build: () => artistSearchCubit,
        act: (cubit) => cubit.onTextChanged(name),
        expect: () => [],
      );
    });

    group('search', () {
      const name = 'text';
      final artists = [_FakeArtist()];

      blocTest<ArtistSearchCubit, ArtistSearchState>(
        'should emit [ ArtistSearchLoading, ArtistSearchLoaded ] when success'
        ' is returned',
        setUp: () {
          when(() => artistRepository.findByName(name))
              .thenAnswer((_) async => right(artists));
        },
        build: () => artistSearchCubit,
        act: (cubit) => cubit
          ..onTextChanged(name)
          ..search(),
        expect: () => [
          const ArtistSearchLoading(),
          ArtistSearchLoaded(right(artists)),
        ],
      );

      blocTest<ArtistSearchCubit, ArtistSearchState>(
        'should emit [ ArtistSearchLoading, ArtistSearchLoaded ] when search '
        'is called multiple times while there is another search is in progress',
        setUp: () {
          when(() => artistRepository.findByName(name)).thenAnswer((_) async {
            await Future.delayed(const Duration(milliseconds: 100));
            return right(artists);
          });
        },
        build: () => artistSearchCubit,
        act: (cubit) => cubit
          ..onTextChanged(name)
          ..search()
          ..search(),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          const ArtistSearchLoading(),
          ArtistSearchLoaded(right(artists)),
        ],
      );

      blocTest<ArtistSearchCubit, ArtistSearchState>(
        'should emit [ ArtistSearchLoading, ArtistSearchLoaded ] with empty '
        'response when name is empty',
        build: () => artistSearchCubit,
        act: (cubit) => cubit.search(),
        expect: () => const [
          ArtistSearchLoading(),
          ArtistSearchLoaded(Right([])),
        ],
      );
    });
  });
}

class _FakeArtist extends Fake implements Artist {}

class _MockArtistRepository extends Mock implements ArtistRepository {}
