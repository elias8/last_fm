import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:networkx/networkx.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../artist.dart';

part 'artist_search_event.dart';
part 'artist_search_state.dart';

EventTransformer<Event> _debounce<Event>() {
  const _duration = Duration(milliseconds: 300);
  return (events, mapper) => events.debounce(_duration).switchMap(mapper);
}

@injectable
class ArtistSearchBloc extends Bloc<ArtistSearchEvent, ArtistSearchState> {
  final ArtistRepository _artistRepository;

  ArtistSearchBloc(this._artistRepository)
      : super(const ArtistSearchInitial()) {
    on<ArtistSearchTextChanged>(_onTextChanged, transformer: _debounce());
  }

  FutureOr<void> _onTextChanged(
    ArtistSearchTextChanged event,
    Emitter<ArtistSearchState> emit,
  ) async {
    final artistName = event.text.trim();
    if (artistName.isEmpty) {
      emit(const ArtistSearchSuccess([]));
    } else {
      emit(const ArtistSearchLoading());
      final response = await _artistRepository.findByName(artistName);
      emit(response.fold(ArtistSearchFailure.new, ArtistSearchSuccess.new));
    }
  }
}
