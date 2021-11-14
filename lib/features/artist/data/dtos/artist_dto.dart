import 'package:json_annotation/json_annotation.dart';

import '../../../shared/shared.dart';
import '../../artist.dart';

part 'artist_dto.g.dart';

typedef ArtistDtoList = List<ArtistDto>;

@JsonSerializable()
class ArtistDto {
  final String name;
  final String listeners;
  final List<ImageDto> image;

  const ArtistDto({
    required this.name,
    required this.image,
    required this.listeners,
  });

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);

  Artist toEntity() {
    return Artist(
      name: name,
      listenersCount: int.tryParse(listeners) ?? 0,
      images: Images(images: image.map((it) => it.toModel()).toList()),
    );
  }
}

extension ArtistDtoListX on ArtistDtoList {
  Artists toEntities() => map((artist) => artist.toEntity()).toList();
}
