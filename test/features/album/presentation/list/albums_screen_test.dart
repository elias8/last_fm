import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumsScreen', () {
    late AlbumsCubit albumsCubit;

    setUpAll(() => registerFallbackValue(const AlbumsInitial()));

    setUp(() {
      albumsCubit = _MockAlbumsCubit();
      getIt.registerFactory(() => albumsCubit);
    });

    testWidgets('renders AlbumsScreen', (tester) async {
      when(albumsCubit.watchAllAlbums).thenAnswer((_) => Future.value());
      when(() => albumsCubit.state).thenReturn(const AlbumsInitial());
      const bottomNavigationBar = SizedBox();
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: AlbumsScreen(
            bottomNavigationBar: bottomNavigationBar,
          ),
        ),
      );

      expect(find.byType(AlbumsScreen), findsOneWidget);
      expect(find.byWidget(bottomNavigationBar), findsOneWidget);
    });
  });
}

class _MockAlbumsCubit extends MockCubit<AlbumsState> implements AlbumsCubit {}
