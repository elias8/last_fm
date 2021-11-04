import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../album.dart';

part 'album_tag_dto.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class AlbumTagDto {
  @HiveField(0)
  final String url;
  @HiveField(1)
  final String name;

  const AlbumTagDto({required this.url, required this.name});

  factory AlbumTagDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumTagDtoFromJson(json);

  AlbumTag toModel() => AlbumTag(url: url, name: name);
}
