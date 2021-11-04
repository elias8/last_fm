part of '../album_detail_screen.dart';

class AlbumMoreInfoButton extends StatelessWidget {
  final String url;

  @visibleForTesting
  const AlbumMoreInfoButton({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 28),
      child: TextButton(
        onPressed: () => getIt<UrlLauncherService>().openUrl(url),
        child: Text(
          context.l10n.more,
          style: textTheme.caption?.copyWith(color: Colors.blue),
        ),
      ),
    );
  }
}
