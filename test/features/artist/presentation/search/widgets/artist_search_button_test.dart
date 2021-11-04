import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$ArtistSearchButton', () {
    late ArtistSearchCubit artistSearchCubit;

    setUpAll(() => registerFallbackValue(const ArtistSearchInitial()));

    setUp(() => artistSearchCubit = _MockArtistSearchCubit());

    testWidgets('renders ArtistSearchButton', (tester) async {
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
              child: const ArtistSearchButton(),
            ),
          ),
        ),
      );

      expect(find.byType(ArtistSearchButton), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('tapping the button should trigger the search', (tester) async {
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
              child: const ArtistSearchButton(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ArtistSearchButton));

      verify(artistSearchCubit.search).called(1);
    });
  });
}

class _MockArtistSearchCubit extends MockCubit<ArtistSearchState>
    implements ArtistSearchCubit {}
