part of '../album_detail_screen.dart';

class TrackListTile extends StatelessWidget {
  final Track track;
  final void Function(Track track)? onTap;

  @visibleForTesting
  const TrackListTile({Key? key, required this.track, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      title: Text(track.name),
      onTap: () => onTap?.call(track),
      contentPadding: const EdgeInsets.only(right: 16),
      leading: SizedBox(
        width: 44,
        height: 40,
        child: Center(
          child: Text(
            '${track.rank}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      subtitle: Text(track.artist.name),
      trailing: Text(
        _formattedDuration(track.duration),
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  String _formattedDuration(Duration duration) {
    final minutes = _twoDigit(duration.inMinutes % 60);
    final seconds = _twoDigit(duration.inSeconds % 60);
    return '$minutes:$seconds';
  }

  String _twoDigit(int number) => number >= 10 ? '$number' : '0$number';
}
