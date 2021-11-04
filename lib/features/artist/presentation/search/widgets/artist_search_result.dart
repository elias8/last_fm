part of '../artist_search_screen.dart';

/// Shows the search result for an artist.
class ArtistSearchResult extends StatelessWidget {
  @visibleForTesting
  const ArtistSearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistSearchCubit, ArtistSearchState>(
      builder: (context, state) {
        if (state is ArtistSearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ArtistSearchLoaded) {
          return state.response.fold(
            (l) => ArtistSearchErrorWidget(error: l),
            (r) => ArtistListView(artists: r),
          );
        } else {
          return const EmptyArtistsWidget();
        }
      },
    );
  }
}
