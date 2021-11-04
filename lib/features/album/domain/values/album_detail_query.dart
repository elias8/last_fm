import 'package:equatable/equatable.dart';

import '../domain.dart';

/// A query used to get a detail information about an album.
class AlbumDetailQuery extends Equatable {
  final String albumName;
  final String artistName;

  const AlbumDetailQuery({
    required this.albumName,
    required this.artistName,
  });

  factory AlbumDetailQuery.fromAlbum(Album album) {
    return AlbumDetailQuery(
      albumName: album.name,
      artistName: album.artist.name,
    );
  }

  @override
  List<Object?> get props => [albumName, artistName];
}
