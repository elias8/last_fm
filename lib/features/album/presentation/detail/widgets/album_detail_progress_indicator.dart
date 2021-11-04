part of '../album_detail_screen.dart';

class AlbumDetailProgressIndicator extends StatelessWidget {
  @visibleForTesting
  const AlbumDetailProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
