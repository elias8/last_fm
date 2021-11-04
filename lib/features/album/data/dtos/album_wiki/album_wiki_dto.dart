import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../album.dart';

part 'album_wiki_dto.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class AlbumWikiDto {
  @HiveField(0)
  final String summary;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String published;

  const AlbumWikiDto({
    required this.summary,
    required this.content,
    required this.published,
  });

  factory AlbumWikiDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumWikiDtoFromJson(json);

  AlbumWiki toModel() {
    return AlbumWiki(
      summary: summary,
      content: content,
      publishedAt: published,
    );
  }
}
