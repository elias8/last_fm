part of '../artist_search_screen.dart';

/// A widget that shows list of multiple [Artists] information using the
/// [ListView] widget.
///
/// If the the [artists] list is empty it will show [ArtistNotFoundWidget].
class ArtistListView extends StatelessWidget {
  final Artists artists;

  @visibleForTesting
  const ArtistListView({Key? key, this.artists = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (artists.isEmpty) return const ArtistNotFoundWidget();
    return ListView.builder(
      itemCount: artists.length,
      itemBuilder: (_, index) => ArtistListTile(artist: artists[index]),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    );
  }
}

/// A message displayed when a search result is empty.
class ArtistNotFoundWidget extends StatelessWidget {
  @visibleForTesting
  const ArtistNotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.artistNotFound,
        style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 18),
      ),
    );
  }
}
