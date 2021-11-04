import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../album.dart';

/// Stores and retrieves [AlbumDto] in/from local storage.
///
/// The implementation uses [Hive] database.
abstract class AlbumLocalSource {
  /// Deletes an album from the local storage matching the given [query].
  Future<void> deleteAlbum(AlbumDetailQueryDto query);

  /// Deletes all albums from the local storage.
  Future<void> deleteAllAlbums();

  /// Returns an album detail matching the given [query].
  Future<AlbumDetailDto?> findAlbumDetail(AlbumDetailQueryDto query);

  /// Returns all albums stored in the local storage.
  Future<List<AlbumDetailDto>> findAllAlbums();

  /// Stores an [album] to the local storage and returns the same [album].
  Future<AlbumDetailDto> saveAlbum(AlbumDetailDto album);

  /// Returns a stream of list of [AlbumDto] stored in local storage.
  ///
  /// A new event will be emitted whenever an [AlbumDto] is updated, removed,
  /// or a new [AlbumDto] is stored.
  Stream<List<AlbumDetailDto>> watchAllAlbums();
}

@Injectable(as: AlbumLocalSource)
class AlbumLocalSourceImpl implements AlbumLocalSource {
  final Box<AlbumDetailDto> _albumBox;

  const AlbumLocalSourceImpl(@Named('albumBox') this._albumBox);

  @override
  Future<void> deleteAlbum(AlbumDetailQueryDto query) {
    return _albumBox.delete(query.toId());
  }

  @override
  Future<void> deleteAllAlbums() => _albumBox.clear();

  @override
  Future<AlbumDetailDto?> findAlbumDetail(AlbumDetailQueryDto query) async {
    return _albumBox.get(query.toId());
  }

  @override
  Future<List<AlbumDetailDto>> findAllAlbums() async {
    return _albumBox.values.toList();
  }

  @override
  Future<AlbumDetailDto> saveAlbum(AlbumDetailDto album) async {
    await _albumBox.put(album.toId(), album);
    return album;
  }

  @override
  Stream<List<AlbumDetailDto>> watchAllAlbums() {
    return _albumBox.watch().map((_) => _albumBox.values.toList());
  }
}

extension on AlbumDetailQueryDto {
  String toId() => '$artist-$album';
}

extension on AlbumDetailDto {
  String toId() => '$artist-$name';
}
