import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$TrackListTile', () {
    late Track track;

    setUp(() {
      track = _MockTrack();
      when(() => track.rank).thenReturn(3);
      when(() => track.name).thenReturn('Hardest To Love');
      when(() => track.artist).thenReturn(const ArtistInfo(name: 'The Weeknd'));
      when(() => track.duration).thenReturn(
        const Duration(minutes: 3, seconds: 31),
      );
    });

    testWidgets('renders TrackListTile', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TrackListTile(track: track))),
      );

      expect(find.byType(TrackListTile), findsOneWidget);
      expect(find.text(track.name), findsOneWidget);
      expect(find.text(track.artist.name), findsOneWidget);
      expect(find.text(track.rank.toString()), findsOneWidget);
      expect(find.text('03:31'), findsOneWidget);
    });

    testWidgets('tapping the widget should call given callback',
        (tester) async {
      Track? selectedTrack;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TrackListTile(
              track: track,
              onTap: (t) => selectedTrack = t,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TrackListTile));

      expect(selectedTrack, isNotNull);
    });
  });
}

class _MockTrack extends Mock implements Track {}
