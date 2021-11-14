import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../artist.dart';

@Injectable(as: ArtistRepository)
class ArtistRepositoryImpl implements ArtistRepository {
  final ArtistRemoteSource _artistRemoteSource;

  const ArtistRepositoryImpl(this._artistRemoteSource);

  @override
  Future<ArtistSearchResponse> findByName(String name) async {
    final response = await _artistRemoteSource.findByName(name);
    return response.map((it) => it.toEntities());
  }
}
