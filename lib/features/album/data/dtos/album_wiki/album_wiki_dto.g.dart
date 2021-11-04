// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_wiki_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumWikiDtoAdapter extends TypeAdapter<AlbumWikiDto> {
  @override
  final int typeId = 3;

  @override
  AlbumWikiDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumWikiDto(
      summary: fields[0] as String,
      content: fields[1] as String,
      published: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AlbumWikiDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.summary)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.published);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumWikiDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumWikiDto _$AlbumWikiDtoFromJson(Map<String, dynamic> json) => AlbumWikiDto(
      summary: json['summary'] as String,
      content: json['content'] as String,
      published: json['published'] as String,
    );
