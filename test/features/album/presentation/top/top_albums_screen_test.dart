import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/core/core.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$TopAlbumsScreen', () {
    const artistName = 'Coldplay';
    late AlbumsCubit albumsCubit;

    setUpAll(() => registerFallbackValue(const AlbumsInitial()));

    setUp(() {
      albumsCubit = _MockAlbumsCubit();
      getIt.registerFactory(() => albumsCubit);
    });

    tearDown(getIt.reset);

    testWidgets('renders TopAlbumsScreen', (tester) async {
      when(() => albumsCubit.loadTopAlbumsByArtistName(artistName))
          .thenAnswer((_) => Future.value());
      when(() => albumsCubit.state).thenReturn(const AlbumsInitial());
      await tester.pumpWidget(
        const MaterialApp(
          home: TopAlbumsScreen(
            artistName: artistName,
          ),
        ),
      );

      expect(find.byType(TopAlbumsScreen), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text(artistName), findsOneWidget);
    });

    testWidgets('shows TopAlbumsListView when response is loaded with data',
        (tester) async {
      when(() => albumsCubit.state).thenReturn(const TopAlbumsSuccess([]));
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
            child: const TopAlbumsScreen(
              artistName: artistName,
            ),
          ),
        ),
      );

      expect(find.byType(TopAlbumsListView), findsOneWidget);
    });

    testWidgets('shows TopAlbumsErrorWidget when response is loaded with error',
        (tester) async {
      const state = TopAlbumsFailure(NetworkException.connection());
      when(() => albumsCubit.state).thenReturn(state);
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
            child: const TopAlbumsScreen(
              artistName: artistName,
            ),
          ),
        ),
      );

      expect(find.byType(TopAlbumsErrorWidget), findsOneWidget);
    });
  });
}

class _MockAlbumsCubit extends MockCubit<AlbumsState> implements AlbumsCubit {}
