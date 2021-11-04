// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// FunctionalEnumGenerator
// **************************************************************************

extension ImageSizeExtension on ImageSize {
  bool get isSmall => this == ImageSize.small;
  bool get isMedium => this == ImageSize.medium;
  bool get isLarge => this == ImageSize.large;
  bool get isExtraLarge => this == ImageSize.extraLarge;
  bool get isMega => this == ImageSize.mega;
  R map<R>({
    required R Function(ImageSize small) small,
    required R Function(ImageSize medium) medium,
    required R Function(ImageSize large) large,
    required R Function(ImageSize extraLarge) extraLarge,
    required R Function(ImageSize mega) mega,
  }) {
    switch (this) {
      case ImageSize.small:
        return small(this);
      case ImageSize.medium:
        return medium(this);
      case ImageSize.large:
        return large(this);
      case ImageSize.extraLarge:
        return extraLarge(this);
      case ImageSize.mega:
        return mega(this);
    }
  }

  R maybeMap<R>({
    R Function(ImageSize small)? small,
    R Function(ImageSize medium)? medium,
    R Function(ImageSize large)? large,
    R Function(ImageSize extraLarge)? extraLarge,
    R Function(ImageSize mega)? mega,
    required R Function() orElse,
  }) {
    if (this == ImageSize.small && small != null) {
      return small(this);
    } else if (this == ImageSize.medium && medium != null) {
      return medium(this);
    } else if (this == ImageSize.large && large != null) {
      return large(this);
    } else if (this == ImageSize.extraLarge && extraLarge != null) {
      return extraLarge(this);
    } else if (this == ImageSize.mega && mega != null) {
      return mega(this);
    } else {
      return orElse();
    }
  }

  R maybeWhen<R>({
    R Function()? small,
    R Function()? medium,
    R Function()? large,
    R Function()? extraLarge,
    R Function()? mega,
    required R Function() orElse,
  }) {
    if (this == ImageSize.small && small != null) {
      return small();
    } else if (this == ImageSize.medium && medium != null) {
      return medium();
    } else if (this == ImageSize.large && large != null) {
      return large();
    } else if (this == ImageSize.extraLarge && extraLarge != null) {
      return extraLarge();
    } else if (this == ImageSize.mega && mega != null) {
      return mega();
    } else {
      return orElse();
    }
  }

  R when<R>({
    required R Function() small,
    required R Function() medium,
    required R Function() large,
    required R Function() extraLarge,
    required R Function() mega,
  }) {
    switch (this) {
      case ImageSize.small:
        return small();
      case ImageSize.medium:
        return medium();
      case ImageSize.large:
        return large();
      case ImageSize.extraLarge:
        return extraLarge();
      case ImageSize.mega:
        return mega();
    }
  }
}
