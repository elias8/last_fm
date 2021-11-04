import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumsPopupMenuButton', () {
    late AlbumsCubit albumsCubit;

    setUpAll(() => registerFallbackValue(const AlbumsInitial()));

    setUp(() => albumsCubit = _MockAlbumsCubit());

    testWidgets('renders AlbumsPopupMenuButton', (tester) async {
      when(() => albumsCubit.state).thenReturn(const AlbumsInitial());
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: albumsCubit,
            child: Scaffold(
              appBar: AppBar(actions: const [AlbumsPopupMenuButton()]),
            ),
          ),
        ),
      );

      expect(find.byType(AlbumsPopupMenuButton), findsOneWidget);
    });

    testWidgets('tapping delete menu item calls delete method', (tester) async {
      final state = AllAlbumsLoaded([_FakeAlbumDetail()]);
      when(() => albumsCubit.state).thenReturn(state);
      when(albumsCubit.deleteAllAlbums).thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider.value(
            value: albumsCubit,
            child: Scaffold(
              appBar: AppBar(actions: const [AlbumsPopupMenuButton()]),
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.more_vert));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(PopupMenuItem));
      await tester.pumpAndSettle();

      verify(albumsCubit.deleteAllAlbums).called(1);
    });
  });
}

class _FakeAlbumDetail extends Fake implements AlbumDetail {}

class _MockAlbumsCubit extends MockCubit<AlbumsState> implements AlbumsCubit {}
