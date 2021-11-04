import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../artist.dart';

@Injectable(as: ArtistRepository)
class ArtistRepositoryImpl implements ArtistRepository {
  final ArtistRemoteSource _artistRemoteSource;

  const ArtistRepositoryImpl(this._artistRemoteSource);

  @override
  Future<ArtistSearchResponse> findByName(String name) {
    return _artistRemoteSource
        .findByName(name)
        .then((response) => response.map((it) => it.toArtists()));
  }
}
