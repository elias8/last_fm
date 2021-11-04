import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumsWidget', () {
    late AlbumsCubit albumsCubit;

    setUpAll(() => registerFallbackValue(const AlbumsInitial()));

    setUp(() => albumsCubit = _MockAlbumsCubit());

    testWidgets('renders AlbumsWidget', (tester) async {
      when(() => albumsCubit.state).thenReturn(const AlbumsInitial());
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: albumsCubit,
            child: const Scaffold(
              body: AlbumsWidget(),
            ),
          ),
        ),
      );

      expect(find.byType(AlbumsWidget), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows no album message when albums list is empty',
        (tester) async {
      when(() => albumsCubit.state).thenReturn(const AllAlbumsLoaded([]));
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider.value(
            value: albumsCubit,
            child: const Scaffold(
              body: AlbumsWidget(),
            ),
          ),
        ),
      );

      expect(find.byType(EmptyAlbumsWidget), findsOneWidget);
      expect(find.text('No Albums Added Yet!'), findsOneWidget);
    });

    testWidgets('shows albums grid view when albums list is not empty',
        (tester) async {
      final state = AllAlbumsLoaded([_FakeAlbumDetail()]);
      when(() => albumsCubit.state).thenReturn(state);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: albumsCubit,
            child: const Scaffold(
              body: AlbumsWidget(),
            ),
          ),
        ),
      );

      expect(find.byType(AlbumsGridView), findsOneWidget);
    });
  });
}

class _FakeAlbumDetail extends Fake implements AlbumDetail {
  @override
  Images get images => const Images();

  @override
  String get name => 'After Hours';
}

class _MockAlbumsCubit extends MockCubit<AlbumsState> implements AlbumsCubit {}
