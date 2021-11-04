part of '../artist_search_screen.dart';

/// Shows an error message by extracting the message from the given [error].
class ArtistSearchErrorWidget extends StatelessWidget {
  final NetworkException error;

  @visibleForTesting
  const ArtistSearchErrorWidget({Key? key, required this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.networkErrorMessage(error.name),
      ),
    );
  }
}
