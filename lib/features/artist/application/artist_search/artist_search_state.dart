part of 'artist_search_bloc.dart';

abstract class ArtistSearchState extends Equatable {
  const ArtistSearchState();

  @override
  List<Object?> get props => [];
}

class ArtistSearchInitial extends ArtistSearchState {
  const ArtistSearchInitial();
}

class ArtistSearchLoading extends ArtistSearchState {
  const ArtistSearchLoading();
}

class ArtistSearchSuccess extends ArtistSearchState {
  final Artists artists;

  const ArtistSearchSuccess(this.artists);

  @override
  List<Object?> get props => artists;
}

class ArtistSearchFailure extends ArtistSearchState {
  final NetworkException<void> error;

  const ArtistSearchFailure(this.error);

  @override
  List<Object?> get props => [error];
}
