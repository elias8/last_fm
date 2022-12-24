import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:networkx/networkx.dart';

import '../../../../core/core.dart';
import '../../album.dart';

typedef AlbumDetailRemoteResponse
    = Either<AlbumDetailNetworkError, AlbumDetailDto>;
typedef TopAlbumsRemoteResponse = Either<TopAlbumsNetworkError, List<AlbumDto>>;

/// A class responsible for fetching album data from the backend API using an
/// Http call.
abstract class AlbumRemoteSource {
  /// Returns an [AlbumDetailDto] by fetching it from the API with the [query].
  Future<AlbumDetailRemoteResponse> findAlbumDetail(AlbumDetailQueryDto query);

  /// Returns a list of [AlbumDto] by fetching it from the backend API using
  /// the [artistName] as a query.
  Future<TopAlbumsRemoteResponse> findTopAlbumsByArtistName(String artistName);
}

@Injectable(as: AlbumRemoteSource)
class AlbumRemoteSourceImpl implements AlbumRemoteSource {
  final Dio _dio;

  const AlbumRemoteSourceImpl(this._dio);

  @override
  Future<AlbumDetailRemoteResponse> findAlbumDetail(
      AlbumDetailQueryDto query) async {
    try {
      final queryParams = {'method': 'album.getinfo', ...query.toJson()};
      final response = await _dio.get('/', queryParameters: queryParams);
      final Map data = response.data!;
      return right(AlbumDetailDto.fromJson(data['album']));
    } on DioError catch (error) {
      return left(
        error.toNetWorkError(onResponseError: _mapAlbumDetailResponseError),
      );
    }
  }

  @override
  Future<TopAlbumsRemoteResponse> findTopAlbumsByArtistName(
      String artistName) async {
    try {
      final query = {'method': 'artist.gettopalbums', 'artist': artistName};
      final response = await _dio.get<Map>('/', queryParameters: query);
      final Map data = response.data!;
      if (data.containsKey('topalbums')) {
        final Map topAlbums = data['topalbums'];
        final albums = List<Map<String, dynamic>>.from(topAlbums['album']);
        return right(albums.map(AlbumDto.fromJson).toList());
      } else {
        return const Left(NetworkError.api(TopAlbumsError.artistNotFound));
      }
    } on DioError catch (error) {
      return left(error.toNetWorkErrorOrThrow());
    }
  }

  AlbumDetailNetworkError? _mapAlbumDetailResponseError(Response response) {
    return response.statusCode == 404
        ? const NetworkError.api(AlbumDetailError.albumNotFound)
        : null;
  }
}
