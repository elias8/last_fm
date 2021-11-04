import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumPopupMenuButton', () {
    late AlbumDetailCubit albumDetailCubit;

    setUpAll(() => registerFallbackValue(const AlbumDetailInitial()));

    setUp(() {
      albumDetailCubit = _MockAlbumDetailCubit();
    });

    testWidgets('renders AlbumPopupMenuButton', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            appBar: AppBar(actions: const [AlbumPopupMenuButton()]),
          ),
        ),
      );

      expect(find.byType(AlbumPopupMenuButton), findsOneWidget);
      expect(find.byType(PopupMenuButton), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });

    testWidgets('tapping delete button deletes an album', (tester) async {
      when(albumDetailCubit.deleteAlbum).thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider.value(
            value: albumDetailCubit,
            child: Scaffold(
              appBar: AppBar(actions: const [AlbumPopupMenuButton()]),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(PopupMenuButton));
      await tester.pumpAndSettle();

      expect(find.text('Remove Album'), findsOneWidget);
      await tester.tap(find.byType(PopupMenuItem));
      await tester.pumpAndSettle();

      verify(albumDetailCubit.deleteAlbum).called(1);
    });
  });
}

class _MockAlbumDetailCubit extends MockCubit<AlbumDetailState>
    implements AlbumDetailCubit {}
