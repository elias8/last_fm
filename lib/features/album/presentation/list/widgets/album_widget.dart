part of '../albums_screen.dart';

/// A widget that shows [Album] information.
class AlbumWidget extends StatelessWidget {
  final Album album;

  @visibleForTesting
  const AlbumWidget({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      context.pushNamed(
        AppRouter.albumDetail,
        queryParams: AlbumDetailQueryDto.fromAlbum(album).toJson(),
      );
    }

    return Card(
      shape: const BeveledRectangleBorder(),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Expanded(child: _AlbumImage(images: album.images)),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Text(
                  album.name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlbumImage extends StatelessWidget {
  final Images images;

  const _AlbumImage({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const placeHolder = Icon(Icons.album, size: 80);
    return images.large.fold(
      () => placeHolder,
      (image) => CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: image.url,
        placeholder: (_, __) => placeHolder,
        errorWidget: (_, __, ___) => placeHolder,
      ),
    );
  }
}
