import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/shared.dart';
import '../../../album.dart';

part 'album_detail_dto.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class AlbumDetailDto {
  @HiveField(0)
  final String url;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String artist;
  @HiveField(3)
  final String listeners;
  @HiveField(4)
  @JsonKey(name: 'playcount')
  final String playCount;
  @HiveField(5)
  final AlbumWikiDto? wiki;
  @HiveField(6)
  final List<ImageDto> image;
  @HiveField(7)
  @TracksConverter()
  final List<TrackDto> tracks;
  @TagsConverter()
  @HiveField(8)
  final List<AlbumTagDto> tags;

  const AlbumDetailDto({
    required this.url,
    required this.name,
    required this.tags,
    required this.wiki,
    required this.image,
    required this.artist,
    required this.tracks,
    required this.playCount,
    required this.listeners,
  });

  factory AlbumDetailDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDetailDtoFromJson(json);

  AlbumDetail toEntity() {
    return AlbumDetail(
      url: url,
      name: name,
      wiki: wiki?.toModel(),
      artist: ArtistInfo(name: artist),
      playCount: int.tryParse(playCount) ?? 0,
      listenerCount: int.tryParse(listeners) ?? 0,
      tags: tags.map((tag) => tag.toModel()).toList(),
      tracks: tracks.map((track) => track.toModel()).toList(),
      images: Images(images: image.map((e) => e.toModel()).toList()),
    );
  }
}

class TagsConverter implements JsonConverter<List<AlbumTagDto>, Object?> {
  const TagsConverter();

  @override
  List<AlbumTagDto> fromJson(Object? json) {
    if (json is Map) {
      final tags = json['tag'];
      if (tags is List<Map<String, dynamic>>) {
        return tags.map(AlbumTagDto.fromJson).toList();
      } else if (tags is Map<String, dynamic>) {
        return [AlbumTagDto.fromJson(tags)];
      }
    }
    return const [];
  }

  @override
  Map<String, dynamic> toJson(List<AlbumTagDto> object) {
    throw UnimplementedError();
  }
}

class TracksConverter implements JsonConverter<List<TrackDto>, Object?> {
  const TracksConverter();

  @override
  List<TrackDto> fromJson(Object? json) {
    if (json is Map) {
      final track = json['track'];
      if (track is Map<String, dynamic>) {
        return [TrackDto.fromJson(track)];
      } else if (track is List) {
        final list = List<Map<String, dynamic>>.from(track);
        return list.map(TrackDto.fromJson).toList();
      }
    }
    return const [];
  }

  @override
  Map<String, dynamic> toJson(List<TrackDto> object) {
    throw UnimplementedError();
  }
}

extension AlbumDetailDtoX on List<AlbumDetailDto> {
  List<AlbumDetail> toEntities() => map((dto) => dto.toEntity()).toList();
}
