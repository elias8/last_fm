import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumMoreInfoButton', () {
    const url = 'some url';
    late UrlLauncherService urlLauncherService;

    setUp(() {
      urlLauncherService = _MockUrlLauncherService();
      getIt.registerFactory(() => urlLauncherService);
    });

    tearDown(getIt.reset);

    testWidgets('renders AlbumMoreInfoButton', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: AlbumMoreInfoButton(url: url)),
        ),
      );

      expect(find.byType(AlbumMoreInfoButton), findsOneWidget);
      expect(find.text('More...'), findsOneWidget);
    });

    testWidgets('pressing the widget should open the url', (tester) async {
      when(() => urlLauncherService.openUrl(url))
          .thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: AlbumMoreInfoButton(url: url)),
        ),
      );

      await tester.tap(find.byType(TextButton));

      verify(() => urlLauncherService.openUrl(url)).called(1);
    });
  });
}

class _MockUrlLauncherService extends Mock implements UrlLauncherService {}
