part of '../albums_screen.dart';

class AlbumsWidget extends StatelessWidget {
  @visibleForTesting
  const AlbumsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumsCubit, AlbumsState>(
      builder: (context, state) {
        if (state is AllAlbumsLoaded) {
          return state.albums.isNotEmpty
              ? AlbumsGridView(albums: state.albums)
              : const EmptyAlbumsWidget();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
