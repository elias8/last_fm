import 'package:equatable/equatable.dart';

class ArtistInfo extends Equatable {
  final String name;

  const ArtistInfo({required this.name});

  @override
  List<Object?> get props => [name];
}
