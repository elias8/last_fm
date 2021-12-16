part of 'album_detail_cubit.dart';

abstract class AlbumDetailState extends Equatable {
  const AlbumDetailState();

  @override
  List<Object?> get props => const [];
}

class AlbumDetailInitial extends AlbumDetailState {
  const AlbumDetailInitial();
}

class AlbumDetailLoading extends AlbumDetailState {
  const AlbumDetailLoading();
}

class AlbumDetailSuccess extends AlbumDetailState {
  final AlbumDetail album;

  const AlbumDetailSuccess(this.album);

  @override
  List<Object?> get props => [album];
}

class AlbumDetailFailure extends AlbumDetailState {
  final AlbumDetailNetworkError error;

  const AlbumDetailFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class AlbumDetailDeleted extends AlbumDetailState {
  const AlbumDetailDeleted();
}
