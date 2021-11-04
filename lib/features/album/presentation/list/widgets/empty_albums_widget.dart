part of '../albums_screen.dart';

class EmptyAlbumsWidget extends StatelessWidget {
  @visibleForTesting
  const EmptyAlbumsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.l10n.noAlbumsAddedYet));
  }
}
