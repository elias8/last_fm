import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/core/core.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$ArtistSearchResult', () {
    late ArtistSearchCubit artistSearchCubit;

    setUpAll(() => registerFallbackValue(const ArtistSearchInitial()));

    setUp(() => artistSearchCubit = _MockArtistSearchCubit());

    testWidgets('renders ArtistSearchResult at initial state', (tester) async {
      when(() => artistSearchCubit.state)
          .thenReturn(const ArtistSearchInitial());
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
              child: const ArtistSearchResult(),
            ),
          ),
        ),
      );

      expect(find.byType(ArtistSearchResult), findsOneWidget);
      expect(find.byType(EmptyArtistsWidget), findsOneWidget);
      expect(
        find.text('Search artists by entering their name.'),
        findsOneWidget,
      );
    });

    testWidgets('shows progress indicator at loading state', (tester) async {
      when(() => artistSearchCubit.state)
          .thenReturn(const ArtistSearchLoading());
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
              child: const ArtistSearchResult(),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows artist list at data loaded state', (tester) async {
      when(() => artistSearchCubit.state)
          .thenReturn(ArtistSearchLoaded(right([])));
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
              child: const ArtistSearchResult(),
            ),
          ),
        ),
      );

      expect(find.byType(ArtistListView), findsOneWidget);
    });

    testWidgets('shows error message at error loaded state', (tester) async {
      const response = NetworkException.cancelled();
      when(() => artistSearchCubit.state)
          .thenReturn(ArtistSearchLoaded(left(response)));
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
              child: const ArtistSearchResult(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ArtistSearchErrorWidget), findsOneWidget);
      expect(find.text('Request cancelled.'), findsOneWidget);
    });
  });
}

class _MockArtistSearchCubit extends MockCubit<ArtistSearchState>
    implements ArtistSearchCubit {}
