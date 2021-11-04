part of 'artist_search_bloc.dart';

abstract class ArtistSearchEvent extends Equatable {
  const ArtistSearchEvent();

  @override
  List<Object?> get props => [];
}

class ArtistSearchTextChanged extends ArtistSearchEvent {
  final String text;

  const ArtistSearchTextChanged(this.text);

  @override
  List<Object?> get props => [text];
}
