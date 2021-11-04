import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumDetailWidget', () {
    late AlbumDetail album;

    setUp(() {
      album = _MockAlbumDetail();
      when(() => album.tracks).thenReturn([_FakeTrack()]);
      when(() => album.images).thenReturn(const Images());
      when(() => album.url).thenReturn('https://last.fm');
      when(() => album.listenerCount).thenReturn(6212302);
      when(() => album.tags).thenReturn([_FakeAlbumTag()]);
      when(() => album.name).thenReturn('My Dear Melancholy');
      when(() => album.artist).thenReturn(const ArtistInfo(name: 'The Weeknd'));
    });

    testWidgets('renders AlbumDetailWidget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: AlbumDetailWidget(album: album),
        ),
      );

      expect(find.byType(AlbumDetailWidget), findsOneWidget);
      expect(find.byType(AlbumOverviewWidget), findsOneWidget);
      expect(find.byType(AlbumTagsWrap), findsOneWidget);
      expect(find.byType(TrackListTile), findsOneWidget);
      expect(find.text(album.name), findsOneWidget);
    });
  });
}

class _FakeAlbumTag extends Fake implements AlbumTag {
  @override
  String get name => 'Pop';

  @override
  String get url => 'https://last.fm/tag/1';
}

class _FakeTrack extends Fake implements Track {
  @override
  ArtistInfo get artist => const ArtistInfo(name: 'The Weeknd');

  @override
  Duration get duration => const Duration(minutes: 4);

  @override
  String get name => 'Try Me';

  @override
  int get rank => 2;
}

class _MockAlbumDetail extends Mock implements AlbumDetail {}
