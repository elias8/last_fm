// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_tag_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumTagDtoAdapter extends TypeAdapter<AlbumTagDto> {
  @override
  final int typeId = 1;

  @override
  AlbumTagDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumTagDto(
      url: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AlbumTagDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumTagDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumTagDto _$AlbumTagDtoFromJson(Map<String, dynamic> json) => AlbumTagDto(
      url: json['url'] as String,
      name: json['name'] as String,
    );
