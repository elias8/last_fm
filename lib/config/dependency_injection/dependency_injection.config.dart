// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i8;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:last_fm/config/dependency_injection/modules/network_module.dart'
    as _i19;
import 'package:last_fm/config/dependency_injection/modules/storage_module.dart'
    as _i18;
import 'package:last_fm/features/album/album.dart' as _i4;
import 'package:last_fm/features/album/application/album_detail/album_detail_cubit.dart'
    as _i17;
import 'package:last_fm/features/album/application/albums/albums_cubit.dart'
    as _i12;
import 'package:last_fm/features/album/data/local_sources/album_local_source.dart'
    as _i7;
import 'package:last_fm/features/album/data/remote_sources/album_remote_source.dart'
    as _i10;
import 'package:last_fm/features/album/data/repositories/album_repository_impl.dart'
    as _i11;
import 'package:last_fm/features/artist/application/artist_search/artist_search_bloc.dart'
    as _i16;
import 'package:last_fm/features/artist/artist.dart' as _i14;
import 'package:last_fm/features/artist/data/remote_sources/artist_remote_source.dart'
    as _i13;
import 'package:last_fm/features/artist/data/repositories/artist_repository_impl.dart'
    as _i15;
import 'package:last_fm/features/shared/infrastructure/url_launcher_service.dart'
    as _i6;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i5;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> $registerDependencies({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    await gh.lazySingletonAsync<_i3.Box<_i4.AlbumDetailDto>>(
      () => storageModule.albumBox,
      instanceName: 'albumBox',
      preResolve: true,
    );
    gh.lazySingleton<_i5.PrettyDioLogger>(() => networkModule.prettyLogger);
    gh.factory<String>(
      () => networkModule.apiKey,
      instanceName: 'ApiKey',
    );
    gh.factory<String>(
      () => networkModule.baseHttpUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i6.UrlLauncherService>(() => _i6.UrlLauncherServiceImpl());
    gh.factory<_i7.AlbumLocalSource>(() => _i7.AlbumLocalSourceImpl(
        gh<_i8.Box<_i4.AlbumDetailDto>>(instanceName: 'albumBox')));
    gh.lazySingleton<_i9.BaseOptions>(() => networkModule.dioBaseOptions(
          gh<String>(instanceName: 'BaseUrl'),
          gh<String>(instanceName: 'ApiKey'),
        ));
    gh.lazySingleton<_i9.Dio>(() => networkModule.dio(
          gh<_i9.BaseOptions>(),
          gh<_i5.PrettyDioLogger>(),
        ));
    gh.factory<_i10.AlbumRemoteSource>(
        () => _i10.AlbumRemoteSourceImpl(gh<_i9.Dio>()));
    gh.factory<_i4.AlbumRepository>(() => _i11.AlbumRepositoryImpl(
          gh<_i4.AlbumLocalSource>(),
          gh<_i4.AlbumRemoteSource>(),
        ));
    gh.factory<_i12.AlbumsCubit>(
        () => _i12.AlbumsCubit(gh<_i4.AlbumRepository>()));
    gh.factory<_i13.ArtistRemoteSource>(
        () => _i13.ArtistRemoteSourceImpl(gh<_i9.Dio>()));
    gh.factory<_i14.ArtistRepository>(
        () => _i15.ArtistRepositoryImpl(gh<_i14.ArtistRemoteSource>()));
    gh.factory<_i16.ArtistSearchBloc>(
        () => _i16.ArtistSearchBloc(gh<_i14.ArtistRepository>()));
    gh.factory<_i17.AlbumDetailCubit>(
        () => _i17.AlbumDetailCubit(gh<_i4.AlbumRepository>()));
    return this;
  }
}

class _$StorageModule extends _i18.StorageModule {}

class _$NetworkModule extends _i19.NetworkModule {}
