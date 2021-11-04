import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../album.dart';

part 'artist_info_dto.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class ArtistInfoDto {
  @HiveField(0)
  final String name;

  const ArtistInfoDto({required this.name});

  factory ArtistInfoDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistInfoDtoFromJson(json);

  ArtistInfo toEntity() => ArtistInfo(name: name);
}
