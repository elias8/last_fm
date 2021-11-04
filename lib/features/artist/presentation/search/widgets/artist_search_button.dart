part of '../artist_search_screen.dart';

/// A button that triggers the search.
///
/// If a search is already in-progress, pressing this button does nothing.
class ArtistSearchButton extends StatelessWidget {
  @visibleForTesting
  const ArtistSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.read<ArtistSearchCubit>().search(),
      child: Text(
        context.l10n.search,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
