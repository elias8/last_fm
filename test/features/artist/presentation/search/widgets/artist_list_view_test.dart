import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';

void main() {
  group('$ArtistListView', () {
    testWidgets('renders ArtistListView', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: ArtistListView(
              artists: [
                _FakeArtist(name: 'The Weeknd'),
                _FakeArtist(name: 'Ed Sheeran'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(ArtistListView), findsOneWidget);
      expect(find.byType(ArtistListTile), findsNWidgets(2));
    });

    testWidgets('shows ArtistNotFoundWidget when list is empty',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: ArtistListView(),
        ),
      );

      expect(find.byType(ArtistNotFoundWidget), findsOneWidget);
    });
  });
}

class _FakeArtist extends Fake implements Artist {
  final String _name;

  _FakeArtist({required String name}) : _name = name;

  @override
  Images get images => const Images();

  @override
  int get listenersCount => 223123091;

  @override
  String get name => _name;
}
