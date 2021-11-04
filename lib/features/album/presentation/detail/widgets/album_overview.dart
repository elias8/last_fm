part of '../album_detail_screen.dart';

class AlbumOverviewWidget extends StatelessWidget {
  final AlbumDetail album;

  @visibleForTesting
  const AlbumOverviewWidget({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  album.name,
                  maxLines: 2,
                  style: textTheme.headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              AlbumMoreInfoButton(url: album.url),
            ],
          ),
          Text(
            album.artist.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          if (album.wiki != null) ...[
            const SizedBox(height: 2),
            Text(
              context.l10n.albumPublishDate(album.wiki!.publishedAt),
              style: textTheme.caption,
            ),
          ],
          const SizedBox(height: 2),
          Text(
            context.l10n.formattedListenerCount(album.listenerCount),
            style: textTheme.caption,
          ),
        ],
      ),
    );
  }
}
