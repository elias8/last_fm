import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$ArtistListTile', () {
    late ArtistSearchCubit artistSearchCubit;
    late Artist artist;

    setUpAll(() => registerFallbackValue(const ArtistSearchInitial()));

    setUp(() {
      artist = _MockArtist();
      artistSearchCubit = _MockArtistSearchCubit();
      when(() => artist.name).thenReturn('The Weeknd');
      when(() => artist.images).thenReturn(const Images());
      when(() => artist.listenersCount).thenReturn(2220184);
    });

    testWidgets('renders ArtistListTile', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: BlocProvider.value(
              value: artistSearchCubit,
              child: ArtistListTile(artist: artist),
            ),
          ),
        ),
      );

      expect(find.byType(ArtistListTile), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text(artist.name), findsOneWidget);
      expect(find.text('2,220,184 listeners'), findsOneWidget);
    });

    testWidgets('pressing the widget should navigate to albums route',
        (tester) async {
      const albumsScreenKey = Key('albums');
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => MaterialPage(
              child: Scaffold(
                body: BlocProvider.value(
                  value: artistSearchCubit,
                  child: ArtistListTile(artist: artist),
                ),
              ),
            ),
          ),
          GoRoute(
            path: '/albums',
            name: AppRouter.albums,
            pageBuilder: (context, state) => MaterialPage(
              child: Container(key: albumsScreenKey),
            ),
          ),
        ],
        errorPageBuilder: (_, __) => const MaterialPage(child: SizedBox()),
      );
      await tester.pumpWidget(
        MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          routerDelegate: router.routerDelegate,
          supportedLocales: AppLocalizations.supportedLocales,
          routeInformationParser: router.routeInformationParser,
        ),
      );

      await tester.tap(find.byType(ArtistListTile));
      await tester.pumpAndSettle();

      expect(find.byKey(albumsScreenKey), findsOneWidget);
    });
  });
}

class _MockArtist extends Mock implements Artist {}

class _MockArtistSearchCubit extends MockCubit<ArtistSearchState>
    implements ArtistSearchCubit {}
