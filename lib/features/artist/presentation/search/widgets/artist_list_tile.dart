part of '../artist_search_screen.dart';

/// A widget that shows an information of specific [Artist].
class ArtistListTile extends StatelessWidget {
  final Artist artist;

  @visibleForTesting
  const ArtistListTile({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.grey.shade200,
        backgroundImage: artist.images.large
            .map((image) => CachedNetworkImageProvider(image.url))
            .toNullable(),
      ),
      title: Text(artist.name),
      subtitle: Text(
        context.l10n.formattedListenerCount(artist.listenersCount),
      ),
      onTap: () => context.pushNamed(
        AppRouter.albums,
        queryParams: {'top': 'true', 'artist': artist.name},
      ),
    );
  }
}
