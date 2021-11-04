part of '../artist_search_screen.dart';

class EmptyArtistsWidget extends StatelessWidget {
  @visibleForTesting
  const EmptyArtistsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.startSearchingArtist,
        style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 18),
      ),
    );
  }
}
