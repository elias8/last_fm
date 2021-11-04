import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$ArtistSearchScreen', () {
    late ArtistSearchBloc artistSearchBloc;

    setUpAll(() {
      registerFallbackValue(_FakeArtistSearchEvent());
      registerFallbackValue(_FakeArtistSearchState());
    });

    setUp(() {
      artistSearchBloc = _MockArtistSearchBloc();
      getIt.registerFactory(() => artistSearchBloc);
    });

    testWidgets('renders ArtistSearchScreen', (tester) async {
      when(() => artistSearchBloc.state)
          .thenReturn(const ArtistSearchInitial());

      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: ArtistSearchScreen(),
        ),
      );

      expect(find.byType(ArtistSearchScreen), findsOneWidget);
      expect(find.byType(EmptyArtistsWidget), findsOneWidget);
      expect(find.byType(ArtistSearchInputField), findsOneWidget);
    });
  });
}

class _FakeArtistSearchEvent extends Fake implements ArtistSearchEvent {}

class _FakeArtistSearchState extends Fake implements ArtistSearchState {}

class _MockArtistSearchBloc
    extends MockBloc<ArtistSearchEvent, ArtistSearchState>
    implements ArtistSearchBloc {}
