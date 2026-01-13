import 'package:equatable/equatable.dart';

class Region extends Equatable {
  final String id;
  final String name;
  final String imagePath; // Asset path for the region image

  const Region({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  @override
  List<Object> get props => [id, name, imagePath];
}
