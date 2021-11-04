import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../features/album/album.dart';

@module
abstract class StorageModule {
  @preResolve
  @lazySingleton
  @Named('albumBox')
  Future<Box<AlbumDetailDto>> get albumBox {
    return Hive.openBox<AlbumDetailDto>('albumBox');
  }
}
