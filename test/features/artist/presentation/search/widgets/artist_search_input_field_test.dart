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
    late ArtistSearchBloc artistSearchBloc;

    setUpAll(() {
      registerFallbackValue(_FakeArtistSearchEvent());
      registerFallbackValue(_FakeArtistSearchState());
    });

    setUp(() => artistSearchBloc = _MockArtistSearchBloc());

    testWidgets('renders ArtistSearchInputField', (tester) async {
      await tester.pumpWidget(
        _MaterialTestApp(
          searchBloc: artistSearchBloc,
          child: const ArtistSearchInputField(),
        ),
      );

      expect(find.byType(ArtistSearchInputField), findsOneWidget);
      expect(find.text('Search Artist'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.clear), findsNothing);
    });

    testWidgets('clear button is displayed when text is not empty',
        (tester) async {
      const text = 'The Weekend';
      await tester.pumpWidget(
        _MaterialTestApp(
          searchBloc: artistSearchBloc,
          child: const ArtistSearchInputField(),
        ),
      );

      await tester.enterText(find.byType(TextField), text);
      await tester.pumpAndSettle();

      expect(find.text(text), findsOneWidget);
      expect(find.byIcon(Icons.clear), findsOneWidget);
    });

    testWidgets('tapping clear icon clears the text and hides the icon itself',
        (tester) async {
      const text = 'Ed Sheeran';
      await tester.pumpWidget(
        _MaterialTestApp(
          searchBloc: artistSearchBloc,
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
          searchBloc: artistSearchBloc,
          child: const ArtistSearchInputField(),
        ),
      );

      await tester.enterText(find.byType(TextField), text);

      verify(() => artistSearchBloc.add(const ArtistSearchTextChanged(text)))
          .called(1);
    });
  });
}

class _FakeArtistSearchEvent extends Fake implements ArtistSearchEvent {}

class _FakeArtistSearchState extends Fake implements ArtistSearchState {}

class _MaterialTestApp extends StatelessWidget {
  final Widget child;
  final ArtistSearchBloc searchBloc;

  const _MaterialTestApp({
    Key? key,
    required this.child,
    required this.searchBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<ArtistSearchBloc>.value(
        value: searchBloc,
        child: Scaffold(body: child),
      ),
    );
  }
}

class _MockArtistSearchBloc
    extends MockBloc<ArtistSearchEvent, ArtistSearchState>
    implements ArtistSearchBloc {}
