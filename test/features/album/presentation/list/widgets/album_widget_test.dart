import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumWidget', () {
    late Album album;

    setUp(() {
      album = _MockAlbum();
      when(() => album.name).thenReturn('True');
      when(() => album.images).thenReturn(const Images());
      when(() => album.artist).thenReturn(const ArtistInfo(name: 'Avicii'));
    });

    testWidgets('renders AlbumWidget', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AlbumWidget(album: album)));

      expect(find.byType(AlbumWidget), findsOneWidget);
      expect(find.text(album.name), findsOneWidget);
      // We are not covering CachedNetworkImage. Instead, we are testing
      // the placeholder.
      expect(find.byIcon(Icons.album), findsOneWidget);
    });

    testWidgets('tapping the widget should navigate to album detail screen',
        (tester) async {
      const albumDetailScreenKey = Key('album-detail');
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => MaterialPage(
              child: Scaffold(body: AlbumWidget(album: album)),
            ),
          ),
          GoRoute(
            path: '/albums',
            name: AppRouter.albumDetail,
            pageBuilder: (context, state) => MaterialPage(
              child: Container(key: albumDetailScreenKey),
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

      await tester.tap(find.byType(AlbumWidget));
      await tester.pumpAndSettle();

      expect(find.byKey(albumDetailScreenKey), findsOneWidget);
    });
  });
}

class _MockAlbum extends Mock implements Album {}
