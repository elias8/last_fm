import '../../../shared/shared.dart';
import '../domain.dart';

typedef AlbumDetails = List<AlbumDetail>;

class AlbumDetail extends Album {
  final String url;
  final Tracks tracks;
  final AlbumTags tags;
  final AlbumWiki? wiki;
  final int listenerCount;

  const AlbumDetail({
    required this.url,
    required this.tags,
    required this.wiki,
    required this.tracks,
    required String name,
    required int playCount,
    required Images images,
    required ArtistInfo artist,
    required this.listenerCount,
  }) : super(
          name: name,
          images: images,
          artist: artist,
          playCount: playCount,
        );

  @override
  List<Object?> get props {
    return [
      url,
      tags,
      wiki,
      name,
      tracks,
      images,
      artist,
      playCount,
      listenerCount,
    ];
  }
}
