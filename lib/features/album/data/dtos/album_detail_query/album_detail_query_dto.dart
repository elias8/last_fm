import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../album.dart';

part 'album_detail_query_dto.g.dart';

@JsonSerializable()
class AlbumDetailQueryDto extends Equatable {
  final String album;
  final String artist;

  const AlbumDetailQueryDto({required this.album, required this.artist});

  factory AlbumDetailQueryDto.fromAlbum(Album album) {
    return AlbumDetailQueryDto(
      artist: album.artist.name,
      album: album.name,
    );
  }

  factory AlbumDetailQueryDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDetailQueryDtoFromJson(json);

  factory AlbumDetailQueryDto.fromModel(AlbumDetailQuery query) {
    return AlbumDetailQueryDto(
      artist: query.artistName,
      album: query.albumName,
    );
  }

  @override
  List<Object?> get props => [album, artist];

  Map<String, String> toJson() => {'artist': artist, 'album': album};

  AlbumDetailQuery toModel() {
    return AlbumDetailQuery(albumName: album, artistName: artist);
  }
}
