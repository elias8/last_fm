// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_detail_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumDetailDtoAdapter extends TypeAdapter<AlbumDetailDto> {
  @override
  final int typeId = 0;

  @override
  AlbumDetailDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumDetailDto(
      url: fields[0] as String,
      name: fields[1] as String,
      tags: (fields[8] as List).cast<AlbumTagDto>(),
      wiki: fields[5] as AlbumWikiDto?,
      image: (fields[6] as List).cast<ImageDto>(),
      artist: fields[2] as String,
      tracks: (fields[7] as List).cast<TrackDto>(),
      playCount: fields[4] as String,
      listeners: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AlbumDetailDto obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(3)
      ..write(obj.listeners)
      ..writeByte(4)
      ..write(obj.playCount)
      ..writeByte(5)
      ..write(obj.wiki)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.tracks)
      ..writeByte(8)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumDetailDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDetailDto _$AlbumDetailDtoFromJson(Map<String, dynamic> json) =>
    AlbumDetailDto(
      url: json['url'] as String,
      name: json['name'] as String,
      tags: const TagsConverter().fromJson(json['tags']),
      wiki: json['wiki'] == null
          ? null
          : AlbumWikiDto.fromJson(json['wiki'] as Map<String, dynamic>),
      image: (json['image'] as List<dynamic>)
          .map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      artist: json['artist'] as String,
      tracks: const TracksConverter().fromJson(json['tracks']),
      playCount: json['playcount'] as String,
      listeners: json['listeners'] as String,
    );
