part of 'albums_cubit.dart';

abstract class AlbumsState extends Equatable {
  const AlbumsState();

  @override
  List<Object?> get props => [];
}

class AlbumsInitial extends AlbumsState {
  const AlbumsInitial();
}

class AlbumsLoading extends AlbumsState {
  const AlbumsLoading();
}

class TopAlbumsLoaded extends AlbumsState {
  final TopAlbumsResponse response;

  const TopAlbumsLoaded(this.response);

  @override
  List<Object?> get props => [response];
}

class AllAlbumsLoaded extends AlbumsState {
  final AlbumDetails albums;

  const AllAlbumsLoaded(this.albums);

  @override
  List<Object?> get props => [albums];
}
