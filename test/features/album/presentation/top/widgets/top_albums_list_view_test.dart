import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$TopAlbumsListView', () {
    late Albums albums;

    setUp(() {
      final album = _MockAlbum();
      when(() => album.playCount).thenReturn(546);
      when(() => album.images).thenReturn(const Images());
      when(() => album.name).thenReturn('Never Forgot You');
      when(() => album.artist).thenReturn(
        const ArtistInfo(name: 'Zara Larson'),
      );
      albums = [album, album];
    });

    testWidgets('renders TopAlbumsListView', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: TopAlbumsListView(albums: albums)),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(TopAlbumsListView), findsOneWidget);
      expect(find.byType(TopAlbumListTile), findsNWidgets(albums.length));
    });

    testWidgets('shows album not found message', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: TopAlbumsListView(albums: [])),
        ),
      );

      expect(find.byType(EmptyTopAlbumsWidget), findsOneWidget);
    });
  });
}

class _MockAlbum extends Mock implements Album {}
