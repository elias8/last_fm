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
    if (album == null) return _findAlbumDetailFromRemoteSource(queryDto);
    return right(album.toEntity());
  }

  @override
  Future<AlbumDetails> findAll() async {
    final storedAlbums = await _albumLocalSource.findAllAlbums();
    return storedAlbums.toEntities();
  }

  @override
  Future<TopAlbumsResponse> findTopAlbumsByArtistName(String name) async {
    final response = await _albumRemoteSource.findTopAlbumsByArtistName(name);
    return response.map((albums) => albums.toEntities());
  }

  @override
  Stream<AlbumDetails> watchAllAlbums() {
    return _albumLocalSource
        .watchAllAlbums()
        .map((storedAlbums) => storedAlbums.toEntities());
  }

  Future<AlbumDetailResponse> _findAlbumDetailFromRemoteSource(
      AlbumDetailQueryDto query) async {
    final response = await _albumRemoteSource.findAlbumDetail(query);
    return response.fold(left, _saveAlbum);
  }

  FutureOr<AlbumDetailResponse> _saveAlbum(AlbumDetailDto album) async {
    final savedAlbum = await _albumLocalSource.saveAlbum(album);
    return right(savedAlbum.toEntity());
  }
}
