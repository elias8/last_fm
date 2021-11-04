// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageDtoAdapter extends TypeAdapter<ImageDto> {
  @override
  final int typeId = 2;

  @override
  ImageDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageDto(
      url: fields[0] as String,
      size: fields[1] as ImageSize,
    );
  }

  @override
  void write(BinaryWriter writer, ImageDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) => ImageDto(
      url: json['#text'] as String,
      size: $enumDecode(_$ImageSizeEnumMap, json['size'],
          unknownValue: ImageSize.extraLarge),
    );

const _$ImageSizeEnumMap = {
  ImageSize.small: 'small',
  ImageSize.medium: 'medium',
  ImageSize.large: 'large',
  ImageSize.extraLarge: 'extralarge',
  ImageSize.mega: 'mega',
};
