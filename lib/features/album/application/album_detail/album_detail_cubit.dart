import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../album.dart';

part 'album_detail_state.dart';

/// A cubit responsible for [AlbumDetail] related functionality.
@injectable
class AlbumDetailCubit extends Cubit<AlbumDetailState> {
  final AlbumRepository _albumRepository;

  AlbumDetailCubit(this._albumRepository) : super(const AlbumDetailInitial());

  /// Deletes an album from [_albumRepository].
  ///
  /// Before this method is called, the current [state] has to be
  /// [AlbumDetailSuccess]. Otherwise, calling this method does nothing.
  Future<void> deleteAlbum() async {
    final currentState = state;
    if (currentState is AlbumDetailSuccess) {
      await _deleteAlbum(currentState.album);
    }
  }

  /// Gets an album detail from the [_albumRepository] and emits
  /// [AlbumDetailSuccess] state with the albums when the detail is returned
  /// without an error. Or it emits [AlbumDetailFailure] state with the error.
  Future<void> loadAlbumDetail(AlbumDetailQuery query) async {
    emit(const AlbumDetailLoading());
    final response = await _albumRepository.findAlbumDetail(query);
    emit(response.fold(AlbumDetailFailure.new, AlbumDetailSuccess.new));
  }

  Future<void> _deleteAlbum(AlbumDetail album) async {
    final request = AlbumDetailQuery.fromAlbum(album);
    await _albumRepository.deleteAlbum(request);
    emit(const AlbumDetailDeleted());
  }
}
