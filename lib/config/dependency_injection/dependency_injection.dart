import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../features/features.dart';
import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$registerDependencies')
Future<void> registerDependencies() async {
  _registerHiveTypeAdapters();
  await getIt.$registerDependencies();
}

void _registerHiveTypeAdapters() {
  Hive.registerAdapter(const ImageSizeAdapter());
  Hive.registerAdapter(AlbumDetailDtoAdapter());
  Hive.registerAdapter(ArtistInfoDtoAdapter());
  Hive.registerAdapter(AlbumWikiDtoAdapter());
  Hive.registerAdapter(AlbumTagDtoAdapter());
  Hive.registerAdapter(TrackDtoAdapter());
  Hive.registerAdapter(ImageDtoAdapter());
}
