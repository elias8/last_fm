import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:functional_enum_annotation/functional_enum_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

class Image extends Equatable {
  final String url;
  final ImageSize size;

  const Image({required this.url, required this.size});

  @override
  List<Object?> get props => [url, size];
}

class Images extends Equatable {
  final List<Image> images;

  const Images({this.images = const []});

  Option<Image> get extraLarge => _firstWhere((size) => size.isExtraLarge);

  Option<Image> get large => _firstWhere((size) => size.isLarge);

  Option<Image> get medium => _firstWhere((size) => size.isMedium);

  Option<Image> get mega => _firstWhere((size) => size.isMega);

  @override
  List<Object?> get props => images;

  Option<Image> get small => _firstWhere((size) => size.isSmall);

  Option<Image> _firstWhere(bool Function(ImageSize) where) {
    for (final image in images) {
      if (where(image.size) && _isValidUrl(image.url)) return some(image);
    }
    return none();
  }
}

bool _isValidUrl(String url) {
  final uri = Uri.tryParse(url);
  return uri != null && (uri.isScheme('http') || uri.isScheme('https'));
}

@functionalEnum
enum ImageSize {
  small,
  medium,
  large,
  @JsonValue('extralarge')
  extraLarge,
  mega
}
