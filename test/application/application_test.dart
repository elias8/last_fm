import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/application/application.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$Application', () {
    late AlbumsCubit albumsCubit;
    late ArtistSearchCubit artistSearchCubit;

    setUpAll(() {
      registerFallbackValue(const AlbumsInitial());
      registerFallbackValue(const ArtistSearchInitial());
    });

    setUp(() {
      albumsCubit = _MockAlbumsCubit();
      artistSearchCubit = _MockArtistSearchCubit();
      getIt.registerFactory(() => albumsCubit);
      getIt.registerFactory(() => artistSearchCubit);
    });

    testWidgets('renders Application and navigates to the MainScreen',
        (tester) async {
      when(() => albumsCubit.state).thenReturn(const AlbumsInitial());
      when(albumsCubit.watchAllAlbums).thenAnswer((_) => Future.value());
      when(() => artistSearchCubit.state)
          .thenReturn(const ArtistSearchInitial());
      await tester.pumpWidget(const Application());

      expect(find.byType(Application), findsOneWidget);
      expect(find.byType(MainScreen), findsOneWidget);
    });
  });
}

class _MockAlbumsCubit extends MockCubit<AlbumsState> implements AlbumsCubit {}

class _MockArtistSearchCubit extends MockCubit<ArtistSearchState>
    implements ArtistSearchCubit {}
