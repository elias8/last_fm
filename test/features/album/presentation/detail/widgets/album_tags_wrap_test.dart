import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/config/config.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumTagsWrap', () {
    late AlbumTags tags;
    late UrlLauncherService urlLauncherService;

    setUp(() {
      tags = const [
        AlbumTag(url: 'https://last.fm/1', name: 'pop'),
        AlbumTag(url: 'https://last.fm/2', name: 'rnb'),
      ];
      urlLauncherService = _MockUrlLauncherService();
      getIt.registerFactory(() => urlLauncherService);
    });

    tearDown(getIt.reset);

    testWidgets('renders AlbumTagsWrap', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AlbumTagsWrap(tags: tags),
          ),
        ),
      );

      expect(find.byType(AlbumTagsWrap), findsOneWidget);
      expect(find.text(tags.first.name), findsOneWidget);
      expect(find.text(tags.last.name), findsOneWidget);
    });

    testWidgets('tapping a tag should open the url', (tester) async {
      when(() => urlLauncherService.openUrl(tags.last.url))
          .thenAnswer((_) => Future.value());
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AlbumTagsWrap(tags: tags),
          ),
        ),
      );

      await tester.tap(find.text(tags.last.name));

      verify(() => urlLauncherService.openUrl(tags.last.url)).called(1);
    });
  });
}

class _MockUrlLauncherService extends Mock implements UrlLauncherService {}
