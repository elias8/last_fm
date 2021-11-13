part of '../top_albums_screen.dart';

class TopAlbumsErrorWidget extends StatelessWidget {
  final String artistName;
  final TopAlbumsNetworkError error;

  @visibleForTesting
  const TopAlbumsErrorWidget({
    Key? key,
    required this.error,
    required this.artistName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            error.isApiError
                ? context.l10n.artistNotFound
                : context.l10n.networkErrorMessage(error.name),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
          ),
          if (!error.isApiError) ...[
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () => context
                    .read<AlbumsCubit>()
                    .loadTopAlbumsByArtistName(artistName),
                child: Text(context.l10n.retry),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
