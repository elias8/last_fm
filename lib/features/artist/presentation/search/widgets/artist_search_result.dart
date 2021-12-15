part of '../artist_search_screen.dart';

/// Shows the search result for an artist.
class ArtistSearchResult extends StatelessWidget {
  @visibleForTesting
  const ArtistSearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistSearchBloc, ArtistSearchState>(
      builder: (context, state) {
        if (state is ArtistSearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ArtistSearchSuccess) {
          return ArtistListView(artists: state.artists);
        } else if (state is ArtistSearchFailure) {
          return ArtistSearchErrorWidget(error: state.error);
        } else {
          return const EmptyArtistsWidget();
        }
      },
    );
  }
}
