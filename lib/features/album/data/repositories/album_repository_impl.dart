import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../album.dart';

@Injectable(as: AlbumRepository)
class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumLocalSource _albumLocalSource;
  final AlbumRemoteSource _albumRemoteSource;

  const AlbumRepositoryImpl(this._albumLocalSource, this._albumRemoteSource);

  @override
  Future<void> deleteAlbum(AlbumDetailQuery query) {
    final queryDto = AlbumDetailQueryDto.fromModel(query);
    return _albumLocalSource.deleteAlbum(queryDto);
  }

  @override
  Future<void> deleteAllAlbums() => _albumLocalSource.deleteAllAlbums();

  @override
  Future<AlbumDetailResponse> findAlbumDetail(AlbumDetailQuery query) async {
    final queryDto = AlbumDetailQueryDto.fromModel(query);
    final album = await _albumLocalSource.findAlbumDetail(queryDto);
    return album == null
        ? await _findAlbumDetailFromRemoteSource(queryDto)
        : right(album.toEntity());
  }

  @override
  Future<AlbumDetails> findAll() {
    return _albumLocalSource
        .findAllAlbums()
        .then((storedAlbums) => storedAlbums.toEntities());
  }

  @override
  Future<TopAlbumsResponse> findTopAlbumsByArtistName(String name) {
    return _albumRemoteSource
        .findTopAlbumsByArtistName(name)
        .then((response) => response.map((albums) => albums.toEntities()));
  }

  @override
  Stream<AlbumDetails> watchAllAlbums() {
    return _albumLocalSource
        .watchAllAlbums()
        .map((storedAlbums) => storedAlbums.toEntities());
  }

  Future<AlbumDetailResponse> _findAlbumDetailFromRemoteSource(
      AlbumDetailQueryDto query) {
    return _albumRemoteSource
        .findAlbumDetail(query)
        .then((response) => response.fold(left, _saveAlbum));
  }

  FutureOr<AlbumDetailResponse> _saveAlbum(AlbumDetailDto album) {
    return _albumLocalSource
        .saveAlbum(album)
        .then((savedAlbum) => right(savedAlbum.toEntity()));
  }
}
