import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$ArtistSearchInputField', () {
    late ArtistSearchCubit artistSearchCubit;

    setUpAll(() => registerFallbackValue(const ArtistSearchInitial()));

    setUp(() => artistSearchCubit = _MockArtistSearchCubit());

    testWidgets('renders initial state', (tester) async {
      await tester.pumpWidget(
        _MaterialTestApp(
          searchCubit: artistSearchCubit,
          child: const ArtistSearchInputField(),
        ),
      );

      expect(find.byType(ArtistSearchInputField), findsOneWidget);
      expect(find.text('Search Artist'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.clear), findsNothing);
    });

    testWidgets(
        'shows and passes entered text to the cubit, and shows clear '
        'icon', (tester) async {
      const text = 'The Weekend';
      await tester.pumpWidget(
        _MaterialTestApp(
          searchCubit: artistSearchCubit,
          child: const ArtistSearchInputField(),
        ),
      );

      await tester.enterText(find.byType(TextField), text);
      await tester.pumpAndSettle();

      expect(find.text(text), findsOneWidget);
      expect(find.byIcon(Icons.clear), findsOneWidget);
      verify(() => artistSearchCubit.onTextChanged(text)).called(1);
    });

    testWidgets('tapping clear icon clears the text and hides the icon itself',
        (tester) async {
      const text = 'Ed Sheeran';
      await tester.pumpWidget(
        _MaterialTestApp(
          searchCubit: artistSearchCubit,
          child: const ArtistSearchInputField(),
        ),
      );

      await tester.enterText(find.byType(TextField), text);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.clear), findsOneWidget);

      await tester.tap(find.byIcon(Icons.clear));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.clear), findsNothing);
    });

    testWidgets('calls search method on the cubit when text is submitted',
        (tester) async {
      const text = 'Justin Bieber';
      await tester.pumpWidget(
        _MaterialTestApp(
          searchCubit: artistSearchCubit,
          child: const ArtistSearchInputField(),
        ),
      );

      await tester.enterText(find.byType(TextField), text);
      await tester.testTextInput.receiveAction(TextInputAction.search);

      verify(artistSearchCubit.search).called(1);
    });
  });
}

class _MaterialTestApp extends StatelessWidget {
  final Widget child;
  final ArtistSearchCubit searchCubit;

  const _MaterialTestApp({
    Key? key,
    required this.child,
    required this.searchCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<ArtistSearchCubit>.value(
        value: searchCubit,
        child: Scaffold(body: child),
      ),
    );
  }
}

class _MockArtistSearchCubit extends MockCubit<ArtistSearchState>
    implements ArtistSearchCubit {}
