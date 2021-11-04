part of '../albums_screen.dart';

class AlbumsPopupMenuButton extends StatelessWidget {
  @visibleForTesting
  const AlbumsPopupMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumsCubit, AlbumsState>(
      builder: (context, state) {
        if (state is AllAlbumsLoaded && state.albums.isNotEmpty) {
          return PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                height: 44,
                padding: const EdgeInsets.only(left: 8),
                onTap: () => context.read<AlbumsCubit>().deleteAllAlbums(),
                child: Text(context.l10n.removeAllAlbums),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
