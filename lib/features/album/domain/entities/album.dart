import 'package:equatable/equatable.dart';

import '../../../shared/models/image.dart';
import '../domain.dart';

typedef Albums = List<Album>;

class Album extends Equatable {
  final String name;
  final int playCount;
  final Images images;
  final ArtistInfo artist;

  const Album({
    required this.name,
    required this.images,
    required this.artist,
    required this.playCount,
  });

  @override
  List<Object?> get props => [name, images, artist, playCount];
}
