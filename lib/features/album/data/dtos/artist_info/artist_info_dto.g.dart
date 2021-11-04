// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_info_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArtistInfoDtoAdapter extends TypeAdapter<ArtistInfoDto> {
  @override
  final int typeId = 6;

  @override
  ArtistInfoDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArtistInfoDto(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ArtistInfoDto obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArtistInfoDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistInfoDto _$ArtistInfoDtoFromJson(Map<String, dynamic> json) =>
    ArtistInfoDto(
      name: json['name'] as String,
    );
