part of '../album_detail_screen.dart';

class AlbumDetailErrorWidget extends StatelessWidget {
  final AlbumDetailQuery query;
  final AlbumDetailNetworkError error;

  @visibleForTesting
  const AlbumDetailErrorWidget({
    Key? key,
    required this.error,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.error)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              error.isCustomError
                  ? context.l10n.albumNotFound
                  : context.l10n.networkErrorMessage(error.name),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
            ),
            if (!error.isCustomError) ...[
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () =>
                      context.read<AlbumDetailCubit>().loadAlbumDetail(query),
                  child: Text(context.l10n.retry),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
