import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/shared.dart';
import '../../../album.dart';
import '../artist_info/artist_info_dto.dart';

part 'album_dto.g.dart';

@JsonSerializable()
class AlbumDto {
  final String name;
  @JsonKey(name: 'playcount')
  final int playCount;
  final ArtistInfoDto artist;
  final List<ImageDto> image;

  const AlbumDto({
    required this.name,
    required this.image,
    required this.artist,
    required this.playCount,
  });

  factory AlbumDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDtoFromJson(json);

  Album toEntity() {
    return Album(
      name: name,
      playCount: playCount,
      artist: artist.toEntity(),
      images: Images(images: image.map((e) => e.toModel()).toList()),
    );
  }
}

extension AlbumDtoListX on List<AlbumDto> {
  Albums toEntities() => map((album) => album.toEntity()).toList();
}
