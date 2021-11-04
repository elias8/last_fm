import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/core/exceptions/exceptions.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumDetailScreen', () {
    late AlbumDetail album;
    final query = _FakeAlbumDetailQuery();
    late AlbumDetailCubit albumDetailCubit;
    late NavigatorObserver navigatorObserver;

    setUpAll(() {
      registerFallbackValue(_FakeRoute());
      registerFallbackValue(const AlbumDetailInitial());
    });

    setUp(() {
      navigatorObserver = _MockNavigatorObserver();

      albumDetailCubit = _MockAlbumDetailCubit();
      getIt.registerFactory(() => albumDetailCubit);

      album = _MockAlbumDetail();
      when(() => album.tracks).thenReturn([_FakeTrack()]);
      when(() => album.images).thenReturn(const Images());
      when(() => album.url).thenReturn('https://last.fm');
      when(() => album.listenerCount).thenReturn(6212302);
      when(() => album.tags).thenReturn([_FakeAlbumTag()]);
      when(() => album.name).thenReturn('My Dear Melancholy');
      when(() => album.artist).thenReturn(const ArtistInfo(name: 'The Weeknd'));
    });

    tearDown(getIt.reset);

    testWidgets('renders AlbumDetailScreen', (tester) async {
      when(() => albumDetailCubit.loadAlbumDetail(query))
          .thenAnswer((_) => Future.value());
      when(() => albumDetailCubit.state).thenReturn(const AlbumDetailInitial());
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: AlbumDetailScreen(query: query),
        ),
      );

      expect(find.byType(AlbumDetailScreen), findsOneWidget);
      expect(find.byType(AlbumDetailProgressIndicator), findsOneWidget);
      verify(() => albumDetailCubit.loadAlbumDetail(query)).called(1);
    });

    testWidgets(
        'shows AlbumDetailErrorWidget when response is loaded with error',
        (tester) async {
      final state = AlbumDetailLoaded(
        left(const NetworkException.connection()),
      );
      when(() => albumDetailCubit.state).thenReturn(state);
      when(() => albumDetailCubit.loadAlbumDetail(query))
          .thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: AlbumDetailScreen(query: query),
        ),
      );

      expect(find.byType(AlbumDetailErrorWidget), findsOneWidget);
    });

    testWidgets('shows AlbumDetailWidget when response is loaded with data',
        (tester) async {
      final state = AlbumDetailLoaded(right(album));
      when(() => albumDetailCubit.state).thenReturn(state);
      when(() => albumDetailCubit.loadAlbumDetail(query))
          .thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: AlbumDetailScreen(query: query),
        ),
      );

      expect(find.byType(AlbumDetailWidget), findsOneWidget);
    });

    testWidgets(
        'shows snack bar message and exits the page when album is deleted',
        (tester) async {
      final state = AlbumDetailLoaded(right(album));
      when(() => albumDetailCubit.state).thenReturn(state);
      whenListen(albumDetailCubit, Stream.value(const AlbumDetailDeleted()));
      when(() => albumDetailCubit.loadAlbumDetail(query))
          .thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [navigatorObserver],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: AlbumDetailScreen(query: query),
        ),
      );

      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
      expect(find.text('Album delete successful.'), findsOneWidget);
      verify(() => navigatorObserver.didPop(any(), any())).called(1);
    });
  });
}

class _FakeAlbumDetailQuery extends Fake implements AlbumDetailQuery {}

class _FakeAlbumTag extends Fake implements AlbumTag {
  @override
  String get name => 'Pop';

  @override
  String get url => 'https://last.fm/tag/1';
}

class _FakeRoute extends Fake implements Route {}

class _FakeTrack extends Fake implements Track {
  @override
  ArtistInfo get artist => const ArtistInfo(name: 'The Weeknd');

  @override
  Duration get duration => const Duration(minutes: 4);

  @override
  String get name => 'Try Me';

  @override
  int get rank => 2;
}

class _MockAlbumDetail extends Mock implements AlbumDetail {}

class _MockAlbumDetailCubit extends MockCubit<AlbumDetailState>
    implements AlbumDetailCubit {}

class _MockNavigatorObserver extends Mock implements NavigatorObserver {}
