// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i4;
import 'package:hive_flutter/hive_flutter.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i12;

import '../../features/album/album.dart' as _i5;
import '../../features/album/application/album_detail/album_detail_cubit.dart'
    as _i14;
import '../../features/album/application/albums/albums_cubit.dart' as _i7;
import '../../features/album/data/local_sources/album_local_source.dart' as _i3;
import '../../features/album/data/remote_sources/album_remote_source.dart'
    as _i16;
import '../../features/album/data/repositories/album_repository_impl.dart'
    as _i6;
import '../../features/artist/application/artist_search/artist_search_bloc.dart'
    as _i10;
import '../../features/artist/artist.dart' as _i8;
import '../../features/artist/data/remote_sources/artist_remote_source.dart'
    as _i17;
import '../../features/artist/data/repositories/artist_repository_impl.dart'
    as _i9;
import '../../features/shared/infrastructure/url_launcher_service.dart' as _i13;
import 'modules/network_module.dart' as _i19;
import 'modules/storage_module.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $registerDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final storageModule = _$StorageModule();
  final networkModule = _$NetworkModule();
  gh.factory<_i3.AlbumLocalSource>(() => _i3.AlbumLocalSourceImpl(
      get<_i4.Box<_i5.AlbumDetailDto>>(instanceName: 'albumBox')));
  gh.factory<_i5.AlbumRepository>(() => _i6.AlbumRepositoryImpl(
      get<_i5.AlbumLocalSource>(), get<_i5.AlbumRemoteSource>()));
  gh.factory<_i7.AlbumsCubit>(
      () => _i7.AlbumsCubit(get<_i5.AlbumRepository>()));
  gh.factory<_i8.ArtistRepository>(
      () => _i9.ArtistRepositoryImpl(get<_i8.ArtistRemoteSource>()));
  gh.factory<_i10.ArtistSearchBloc>(
      () => _i10.ArtistSearchBloc(get<_i8.ArtistRepository>()));
  await gh.lazySingletonAsync<_i11.Box<_i5.AlbumDetailDto>>(
      () => storageModule.albumBox,
      instanceName: 'albumBox',
      preResolve: true);
  gh.lazySingleton<_i12.PrettyDioLogger>(() => networkModule.prettyLogger);
  gh.factory<String>(() => networkModule.apiKey, instanceName: 'ApiKey');
  gh.factory<String>(() => networkModule.baseHttpUrl, instanceName: 'BaseUrl');
  gh.factory<_i13.UrlLauncherService>(() => _i13.UrlLauncherServiceImpl());
  gh.factory<_i14.AlbumDetailCubit>(
      () => _i14.AlbumDetailCubit(get<_i5.AlbumRepository>()));
  gh.lazySingleton<_i15.BaseOptions>(() => networkModule.dioBaseOptions(
      get<String>(instanceName: 'BaseUrl'),
      get<String>(instanceName: 'ApiKey')));
  gh.lazySingleton<_i15.Dio>(() =>
      networkModule.dio(get<_i15.BaseOptions>(), get<_i12.PrettyDioLogger>()));
  gh.factory<_i16.AlbumRemoteSource>(
      () => _i16.AlbumRemoteSourceImpl(get<_i15.Dio>()));
  gh.factory<_i17.ArtistRemoteSource>(
      () => _i17.ArtistRemoteSourceImpl(get<_i15.Dio>()));
  return get;
}

class _$StorageModule extends _i18.StorageModule {}

class _$NetworkModule extends _i19.NetworkModule {}
