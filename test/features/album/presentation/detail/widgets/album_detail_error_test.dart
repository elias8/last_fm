import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';
import 'package:networkx/networkx.dart';

void main() {
  group('$AlbumDetailErrorWidget', () {
    final query = _FakeAlbumDetailQuery();
    late AlbumDetailCubit albumDetailCubit;

    setUpAll(() => registerFallbackValue(const AlbumDetailInitial()));

    setUp(() {
      albumDetailCubit = _MockAlbumDetailCubit();
    });

    testWidgets('renders AlbumDetailErrorWidget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: AlbumDetailErrorWidget(
            error: const NetworkError.api(
              AlbumDetailError.albumNotFound,
            ),
            query: query,
          ),
        ),
      );

      expect(find.byType(AlbumDetailErrorWidget), findsOneWidget);
      expect(find.text('Album not found.'), findsOneWidget);
      expect(find.byType(TextButton), findsNothing);
    });

    testWidgets('tapping retry button should restart to load an album',
        (tester) async {
      when(() => albumDetailCubit.loadAlbumDetail(query))
          .thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider.value(
            value: albumDetailCubit,
            child: AlbumDetailErrorWidget(
              error: const NetworkError.server(),
              query: query,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));

      expect(find.text('Server error. Try again later.'), findsOneWidget);
      verify(() => albumDetailCubit.loadAlbumDetail(query)).called(1);
    });
  });
}

class _FakeAlbumDetailQuery extends Fake implements AlbumDetailQuery {}

class _MockAlbumDetailCubit extends MockCubit<AlbumDetailState>
    implements AlbumDetailCubit {}
