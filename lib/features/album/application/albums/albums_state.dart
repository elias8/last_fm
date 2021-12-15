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

class TopAlbumsSuccess extends AlbumsState {
  final Albums albums;

  const TopAlbumsSuccess(this.albums);

  @override
  List<Object?> get props => [albums];
}

class TopAlbumsFailure extends AlbumsState {
  final TopAlbumsNetworkError error;

  const TopAlbumsFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class AllAlbumsLoaded extends AlbumsState {
  final AlbumDetails albums;

  const AllAlbumsLoaded(this.albums);

  @override
  List<Object?> get props => [albums];
}
