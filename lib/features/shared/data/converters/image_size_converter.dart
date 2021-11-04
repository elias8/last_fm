// coverage:ignore-file
import 'package:hive/hive.dart';

import '../../../shared/shared.dart';

class ImageSizeAdapter implements TypeAdapter<ImageSize> {
  const ImageSizeAdapter();

  @override
  int get hashCode => typeId.hashCode;

  @override
  int get typeId => 5;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;

  @override
  ImageSize read(BinaryReader reader) => ImageSize.values[reader.readByte()];

  @override
  void write(BinaryWriter writer, ImageSize obj) {
    writer.writeByte(ImageSize.values.indexOf(obj));
  }
}
