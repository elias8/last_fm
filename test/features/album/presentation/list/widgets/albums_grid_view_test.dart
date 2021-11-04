import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last_fm/features/features.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('$AlbumsGridView', () {
    late Albums albums;

    setUp(() {
      final album = _MockAlbum();
      when(() => album.name).thenReturn('All Time Low');
      when(() => album.images).thenReturn(const Images());
      albums = [album, album];
    });

    testWidgets('renders AlbumsGridView', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: AlbumsGridView(albums: albums))),
      );

      expect(find.byType(AlbumsGridView), findsOneWidget);
      expect(find.byType(AlbumWidget), findsNWidgets(albums.length));
    });
  });
}

class _MockAlbum extends Mock implements Album {}
