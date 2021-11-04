part of '../album_detail_screen.dart';

class AlbumTagsWrap extends StatelessWidget {
  final AlbumTags tags;

  @visibleForTesting
  const AlbumTagsWrap({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: tags.map((tag) => _AlbumTagButton(tag: tag)).toList(),
      ),
    );
  }
}

class _AlbumTagButton extends StatelessWidget {
  final AlbumTag tag;

  const _AlbumTagButton({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ActionChip(
        onPressed: () => getIt<UrlLauncherService>().openUrl(tag.url),
        label: Text(tag.name),
        shadowColor: Colors.grey.shade300,
        backgroundColor: Colors.grey.shade200,
        labelStyle: Theme.of(context)
            .textTheme
            .caption
            ?.copyWith(color: Colors.grey.shade800),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(width: .1),
        ),
      ),
    );
  }
}
