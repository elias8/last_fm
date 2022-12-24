// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrackDtoAdapter extends TypeAdapter<TrackDto> {
  @override
  final int typeId = 4;

  @override
  TrackDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrackDto(
      duration: fields[3] as int?,
      name: fields[2] as String,
      rank: fields[0] as int,
      artist: fields[4] as ArtistInfoDto,
    );
  }

  @override
  void write(BinaryWriter writer, TrackDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.rank)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.artist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackDto _$TrackDtoFromJson(Map<String, dynamic> json) => TrackDto(
      duration: json['duration'] as int?,
      name: json['name'] as String,
      rank: const TrackRankConverter()
          .fromJson(json['@attr'] as Map<String, dynamic>),
      artist: ArtistInfoDto.fromJson(json['artist'] as Map<String, dynamic>),
    );
