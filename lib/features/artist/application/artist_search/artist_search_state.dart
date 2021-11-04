part of 'artist_search_cubit.dart';

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

class ArtistSearchLoaded extends ArtistSearchState {
  final ArtistSearchResponse response;

  const ArtistSearchLoaded(this.response);

  @override
  List<Object?> get props => [response];
}
