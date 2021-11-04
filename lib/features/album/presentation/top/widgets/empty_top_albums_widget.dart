part of '../top_albums_screen.dart';

class EmptyTopAlbumsWidget extends StatelessWidget {
  @visibleForTesting
  const EmptyTopAlbumsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.l10n.topAlbumsNotFound));
  }
}
