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

class AlbumDetailLoaded extends AlbumDetailState {
  final AlbumDetailResponse response;

  const AlbumDetailLoaded(this.response);

  @override
  List<Object?> get props => [response];
}

class AlbumDetailDeleted extends AlbumDetailState {
  const AlbumDetailDeleted();
}
