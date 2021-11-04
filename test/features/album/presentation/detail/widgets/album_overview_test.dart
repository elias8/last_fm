import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumOverviewWidget', () {
    late AlbumDetail album;

    setUp(() {
      album = _MockAlbumDetail();
      when(() => album.name).thenReturn('Purpose');
      when(() => album.url).thenReturn('https://last.fm');
      when(() => album.listenerCount).thenReturn(7400000);
      when(() => album.wiki).thenReturn(_FakeAlbumWiki());
      when(() => album.artist).thenReturn(_FakeArtistInfo());
    });

    testWidgets('renders AlbumOverviewWidget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: AlbumOverviewWidget(album: album),
        ),
      );

      expect(find.byType(AlbumOverviewWidget), findsOneWidget);
      expect(find.text(album.name), findsOneWidget);
      expect(find.byType(AlbumMoreInfoButton), findsOneWidget);
      expect(find.text(album.artist.name), findsOneWidget);
      expect(find.text('Album . ${album.wiki!.publishedAt}'), findsOneWidget);
      expect(find.text('7,400,000 listeners'), findsOneWidget);
    });
  });
}

class _FakeAlbumWiki extends Fake implements AlbumWiki {
  @override
  String get publishedAt => 'Wed 3 Nov, 2021';
}

class _FakeArtistInfo extends Fake implements ArtistInfo {
  @override
  String get name => 'Justine Bieber';
}

class _MockAlbumDetail extends Mock implements AlbumDetail {}
