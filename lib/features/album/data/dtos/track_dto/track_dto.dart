import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../album.dart';

part 'track_dto.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class TrackDto {
  @HiveField(0)
  @TrackRankConverter()
  @JsonKey(name: '@attr')
  @HiveField(1)
  final int rank;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int duration;
  @HiveField(4)
  final ArtistInfoDto artist;

  const TrackDto({
    required this.name,
    required this.rank,
    required this.artist,
    required this.duration,
  });

  factory TrackDto.fromJson(Map<String, dynamic> json) =>
      _$TrackDtoFromJson(json);

  Track toModel() {
    return Track(
      rank: rank,
      name: name,
      artist: artist.toEntity(),
      duration: Duration(seconds: duration),
    );
  }
}

class TrackRankConverter implements JsonConverter<int, Map<String, dynamic>> {
  const TrackRankConverter();

  @override
  int fromJson(Map<String, dynamic> json) => (json['rank'] as num).toInt();

  @override
  Map<String, dynamic> toJson(int object) => {'rank': object};
}
