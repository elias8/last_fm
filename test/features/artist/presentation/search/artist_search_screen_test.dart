import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$ArtistSearchScreen', () {
    late ArtistSearchCubit artistSearchCubit;

    setUpAll(() => registerFallbackValue(const ArtistSearchInitial()));

    setUp(() {
      artistSearchCubit = _MockArtistSearchCubit();
      getIt.registerFactory(() => artistSearchCubit);
    });

    testWidgets('renders ArtistSearchScreen', (tester) async {
      when(() => artistSearchCubit.state)
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
      expect(find.byType(ArtistSearchButton), findsOneWidget);
    });
  });
}

class _MockArtistSearchCubit extends MockCubit<ArtistSearchState>
    implements ArtistSearchCubit {}
