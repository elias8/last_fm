import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/core/core.dart';
import 'package:last_fm/features/album/album.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$TopAlbumsErrorWidget', () {
    const artistName = 'Maroon 5';
    late AlbumsCubit albumsCubit;

    setUpAll(() => registerFallbackValue(const AlbumsInitial()));

    setUp(() {
      albumsCubit = _MockAlbumsCubit();
    });

    testWidgets('renders TopAlbumsErrorWidget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: TopAlbumsErrorWidget(
            error: NetworkException.custom(TopAlbumsError.artistNotFound),
            artistName: artistName,
          ),
        ),
      );

      expect(find.byType(TopAlbumsErrorWidget), findsOneWidget);
      expect(find.text('Artist not found.'), findsOneWidget);
      expect(find.byType(TextButton), findsNothing);
    });

    testWidgets('tapping retry button should restart to load an top albums',
        (tester) async {
      when(() => albumsCubit.loadTopAlbumsByArtistName(artistName))
          .thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider.value(
            value: albumsCubit,
            child: const TopAlbumsErrorWidget(
              error: NetworkException.server(),
              artistName: artistName,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));

      expect(find.text('Server error. Try again later.'), findsOneWidget);
      verify(() => albumsCubit.loadTopAlbumsByArtistName(artistName)).called(1);
    });
  });
}

class _MockAlbumsCubit extends MockCubit<AlbumsState> implements AlbumsCubit {}
