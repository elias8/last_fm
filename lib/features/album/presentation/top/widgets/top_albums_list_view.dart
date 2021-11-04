part of '../top_albums_screen.dart';

class TopAlbumsListView extends StatelessWidget {
  final Albums albums;

  @visibleForTesting
  const TopAlbumsListView({Key? key, required this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (albums.isEmpty) return const EmptyTopAlbumsWidget();
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (_, index) => TopAlbumListTile(album: albums[index]),
    );
  }
}
