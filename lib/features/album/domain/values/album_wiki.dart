import 'package:equatable/equatable.dart';

/// Contains detailed information about an album.
class AlbumWiki extends Equatable {
  /// The summary of an album.
  final String summary;

  /// The content of an album.
  final String content;

  /// The date an albums is published.
  final String publishedAt;

  const AlbumWiki({
    required this.summary,
    required this.content,
    required this.publishedAt,
  });

  @override
  List<Object?> get props => [summary, content, publishedAt];
}
