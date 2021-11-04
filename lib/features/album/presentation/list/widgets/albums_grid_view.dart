part of '../albums_screen.dart';

class AlbumsGridView extends StatelessWidget {
  final Albums albums;

  @visibleForTesting
  const AlbumsGridView({Key? key, this.albums = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: albums.length,
      padding: const EdgeInsets.all(4),
      itemBuilder: (_, index) => AlbumWidget(album: albums[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 2,
      ),
    );
  }
}
