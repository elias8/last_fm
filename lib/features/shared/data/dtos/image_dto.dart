import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../shared.dart';

part 'image_dto.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class ImageDto {
  @HiveField(0)
  @JsonKey(name: '#text')
  final String url;
  @HiveField(1)
  @JsonKey(unknownEnumValue: ImageSize.extraLarge)
  final ImageSize size;

  const ImageDto({required this.url, required this.size});

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);

  Image toModel() => Image(url: url, size: size);
}
