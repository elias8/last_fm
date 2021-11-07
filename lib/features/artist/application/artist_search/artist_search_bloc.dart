import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../artist.dart';

part 'artist_search_event.dart';
part 'artist_search_state.dart';

EventTransformer<Event> _debounce<Event>() {
  const _duration = Duration(milliseconds: 300);
  return (events, mapper) => events.debounce(_duration).switchMap(mapper);
}

typedef _Emitter = Emitter<ArtistSearchState>;

@injectable
class ArtistSearchBloc extends Bloc<ArtistSearchEvent, ArtistSearchState> {
  final ArtistRepository _artistRepository;

  ArtistSearchBloc(this._artistRepository)
      : super(const ArtistSearchInitial()) {
    on<ArtistSearchTextChanged>(_onTextChanged, transformer: _debounce());
  }

  FutureOr<void> _onTextChanged(ArtistSearchTextChanged event, _Emitter emit) {
    final artistName = event.text.trim();
    if (artistName.isEmpty) {
      emit(const ArtistSearchLoaded(Right([])));
    } else {
      emit(const ArtistSearchLoading());
      return _artistRepository
          .findByName(artistName)
          .then((response) => ArtistSearchLoaded(response))
          .then(emit);
    }
  }
}
