import 'package:equatable/equatable.dart';

import '../../album.dart';

/// List of [Track].
typedef Tracks = List<Track>;

/// Individual song or instrumental recording.
class Track extends Equatable {
  /// The rank of the track in an album.
  final int rank;

  /// The name of the track.
  final String name;

  /// The singer information.
  final ArtistInfo artist;

  /// The duration of the track.
  final Duration duration;

  const Track({
    required this.rank,
    required this.name,
    required this.artist,
    required this.duration,
  });

  @override
  List<Object?> get props => [rank, name, artist, duration];
}
