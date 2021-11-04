part of '../top_albums_screen.dart';

class TopAlbumListTile extends StatelessWidget {
  final Album album;

  @visibleForTesting
  const TopAlbumListTile({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const placeholder = Icon(Icons.album, size: 56);
    return ListTile(
      onTap: () => context.pushNamed(
        AppRouter.albumDetail,
        queryParams: AlbumDetailQueryDto.fromAlbum(album).toJson(),
      ),
      leading: CachedNetworkImage(
        width: 64,
        height: 64,
        placeholder: (_, __) => placeholder,
        errorWidget: (_, __, ___) => placeholder,
        imageUrl: album.images.large.map((a) => a.url).toNullable() ?? '',
      ),
      title: Text(
        album.name,
        style: textTheme.headline6?.copyWith(fontSize: 14),
      ),
      subtitle: Text(
        context.l10n.formattedPlayCount(album.playCount),
        style: textTheme.caption,
      ),
    );
  }
}
