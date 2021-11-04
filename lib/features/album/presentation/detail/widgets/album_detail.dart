part of '../album_detail_screen.dart';

class AlbumDetailWidget extends StatefulWidget {
  final AlbumDetail album;

  @visibleForTesting
  const AlbumDetailWidget({Key? key, required this.album}) : super(key: key);

  @override
  State<AlbumDetailWidget> createState() => _AlbumDetailWidgetState();
}

class _AlbumDetailWidgetState extends State<AlbumDetailWidget> {
  late final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: 260,
            actions: const [AlbumPopupMenuButton()],
            flexibleSpace: AppBarImage(
              controller: _controller,
              album: widget.album,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              _buildListItem,
              childCount: widget.album.tracks.length + 2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget? _buildListItem(BuildContext context, int index) {
    if (index == 0) {
      return AlbumOverviewWidget(album: widget.album);
    } else if (index == 1) {
      return AlbumTagsWrap(tags: widget.album.tags);
    } else {
      return TrackListTile(track: widget.album.tracks[index - 2]);
    }
  }
}
