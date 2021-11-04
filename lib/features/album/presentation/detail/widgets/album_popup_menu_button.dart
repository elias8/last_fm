part of '../album_detail_screen.dart';

class AlbumPopupMenuButton extends StatelessWidget {
  @visibleForTesting
  const AlbumPopupMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          height: 44,
          onTap: () => context.read<AlbumDetailCubit>().deleteAlbum(),
          child: Text(context.l10n.removeAlbum),
        ),
      ],
    );
  }
}
