import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/application/application.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$Application', () {
    late AlbumsCubit albumsCubit;
    late ArtistSearchBloc artistSearchBloc;

    setUpAll(() {
      registerFallbackValue(const AlbumsInitial());
      registerFallbackValue(_FakeArtistSearchEvent());
      registerFallbackValue(_FakeArtistSearchState());
    });

    setUp(() {
      albumsCubit = _MockAlbumsCubit();
      artistSearchBloc = _MockArtistSearchBloc();
      getIt.registerFactory(() => albumsCubit);
      getIt.registerFactory(() => artistSearchBloc);
    });

    tearDown(getIt.reset);

    testWidgets('renders Application and navigates to the MainScreen',
        (tester) async {
      when(() => albumsCubit.state).thenReturn(const AlbumsInitial());
      when(albumsCubit.watchAllAlbums).thenAnswer((_) => Future.value());
      when(() => artistSearchBloc.state)
          .thenReturn(const ArtistSearchInitial());
      await tester.pumpWidget(const Application());

      expect(find.byType(Application), findsOneWidget);
      expect(find.byType(MainScreen), findsOneWidget);
    });
  });
}

class _FakeArtistSearchEvent extends Fake implements ArtistSearchEvent {}

class _FakeArtistSearchState extends Fake implements ArtistSearchState {}

class _MockAlbumsCubit extends MockCubit<AlbumsState> implements AlbumsCubit {}

class _MockArtistSearchBloc extends MockCubit<ArtistSearchState>
    implements ArtistSearchBloc {}
