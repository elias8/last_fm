import 'package:equatable/equatable.dart';

/// List of [AlbumTag].
typedef AlbumTags = List<AlbumTag>;

class AlbumTag extends Equatable {
  /// A url redirects to show more information about the tag.
  final String url;

  /// The name of the tag.
  final String name;

  const AlbumTag({required this.url, required this.name});

  @override
  List<Object?> get props => [url, name];
}
