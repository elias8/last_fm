part of '../album_detail_screen.dart';

class AppBarImage extends StatelessWidget {
  final AlbumDetail album;
  final ScrollController controller;

  @visibleForTesting
  const AppBarImage({Key? key, required this.album, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const placeholder = Icon(Icons.album, size: 96);
    final imageUrl = album.images.large.map((a) => a.url).toNullable() ?? '';
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return FlexibleSpaceBar(
          title: Visibility(
            visible: controller.offset >= 216,
            child: Text(album.name),
          ),
          background: child,
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            placeholder: (_, __) => placeholder,
            errorWidget: (_, __, ___) => placeholder,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (_, __) => placeholder,
              errorWidget: (_, __, ___) => placeholder,
            ),
          ),
        ],
      ),
    );
  }
}
