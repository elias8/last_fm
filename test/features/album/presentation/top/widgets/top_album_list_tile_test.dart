import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$TopAlbumListTile', () {
    late Album album;

    setUp(() {
      album = _MockAlbum();
      when(() => album.playCount).thenReturn(546);
      when(() => album.name).thenReturn('After Hours');
      when(() => album.images).thenReturn(const Images());
      when(() => album.artist).thenReturn(const ArtistInfo(name: 'The Weeknd'));
    });

    testWidgets('renders TopAlbumListTile', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: TopAlbumListTile(album: album)),
        ),
      );

      expect(find.byType(TopAlbumListTile), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.text(album.name), findsOneWidget);
      expect(find.text('${album.playCount} plays'), findsOneWidget);
    });

    testWidgets('tapping the widget navigates to album detail page',
        (tester) async {
      const albumDetailScreen = Key('album-detail');
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => MaterialPage(
              child: Scaffold(body: TopAlbumListTile(album: album)),
            ),
          ),
          GoRoute(
            path: '/detail',
            name: AppRouter.albumDetail,
            pageBuilder: (context, state) => MaterialPage(
              child: Container(key: albumDetailScreen),
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

      await tester.tap(find.byType(TopAlbumListTile));
      await tester.pumpAndSettle();

      expect(find.byKey(albumDetailScreen), findsOneWidget);
    });
  });
}

class _MockAlbum extends Mock implements Album {}
