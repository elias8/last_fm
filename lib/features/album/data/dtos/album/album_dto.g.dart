// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDto _$AlbumDtoFromJson(Map<String, dynamic> json) => AlbumDto(
      name: json['name'] as String,
      image: (json['image'] as List<dynamic>)
          .map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      artist: ArtistInfoDto.fromJson(json['artist'] as Map<String, dynamic>),
      playCount: json['playcount'] as int,
    );
