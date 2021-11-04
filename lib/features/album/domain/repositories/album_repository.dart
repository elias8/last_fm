import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../album/album.dart';

/// An error that is returned from a remote data source when requesting for
/// an album detail.
typedef AlbumDetailNetworkError = NetworkException<AlbumDetailError>;

/// A response returned when [AlbumDetail] is requested.
typedef AlbumDetailResponse = Either<AlbumDetailNetworkError, AlbumDetail>;

/// An error that is returned from a remote data source when requesting for
/// top albums of an artist.
typedef TopAlbumsNetworkError = NetworkException<TopAlbumsError>;

/// A response returned when top [Albums] are requested.
typedef TopAlbumsResponse = Either<TopAlbumsNetworkError, Albums>;

/// Possible errors that could occur when trying to get an album detail.
enum AlbumDetailError {
  /// Happens when an album could not be found with the given query.
  ///
  /// For example, when querying album detail by not existing/invalid artist or
  /// album name.
  albumNotFound,
}

/// A repository responsible for storing and retrieving [Album]/s data to/from
/// different data sources.
///
/// The implementation uses [AlbumLocalSource] to persist data on a device, and
/// [AlbumRemoteSource] to fetch data from the backend API.
abstract class AlbumRepository {
  /// Deletes an [AlbumDetail] with given [query] from the local source.
  Future<void> deleteAlbum(AlbumDetailQuery query);

  /// Removes all stored [Albums] from the local storage.
  Future<void> deleteAllAlbums();

  /// Returns [AlbumDetail] from the local storage. If the [AlbumDetail] is not
  /// found in the local storage it will get it from the remote data source.
  ///
  /// When the [AlbumDetail] is fetched from the remote source it will be stored
  /// in the local storage.
  Future<AlbumDetailResponse> findAlbumDetail(AlbumDetailQuery query);

  /// Returns all [AlbumDetails] stored in the local storage.
  Future<AlbumDetails> findAll();

  /// Returns top [Albums] of an artist with the given name by fetching it from
  /// the remote source.
  ///
  /// The top [Albums] will be stored in the local storage if a successful
  /// response is returned from the remote source. Otherwise,
  /// [TopAlbumsNetworkError] will be returned.
  Future<TopAlbumsResponse> findTopAlbumsByArtistName(String name);

  /// Returns stream of [AlbumDetails] by listening to updates in the local
  /// storage.
  Stream<AlbumDetails> watchAllAlbums();
}

/// Possible errors that could occur when trying to get top albums for a
/// specific artist.
enum TopAlbumsError {
  /// Happens when an artist could not be found with a given query.
  ///
  /// For example, when searching top albums by not existing/invalid artist name.
  artistNotFound,
}
