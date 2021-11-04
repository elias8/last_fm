import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../artist.dart';

part 'artist_search_state.dart';

@injectable
class ArtistSearchCubit extends Cubit<ArtistSearchState> {
  final ArtistRepository _artistRepository;
  Option<String> _currentSearchText = none();

  ArtistSearchCubit(this._artistRepository)
      : super(const ArtistSearchInitial());

  /// Updates the current searching artist name.
  void onTextChanged(String text) {
    final name = text.trim();
    _currentSearchText = name.isEmpty ? none() : some(name);
  }

  /// Starts the search. It will try to find artists with the searched name from
  /// the [_artistRepository].
  FutureOr<void> search() async {
    if (state is! ArtistSearchLoading) {
      emit(const ArtistSearchLoading());
      await _currentSearchText.fold<FutureOr>(_emitEmptyResponse, _search);
    }
  }

  void _emitEmptyResponse() => emit(const ArtistSearchLoaded(Right([])));

  FutureOr<void> _search(String artistName) async {
    return _artistRepository
        .findByName(artistName)
        .then((response) => ArtistSearchLoaded(response))
        .then(emit);
  }
}
