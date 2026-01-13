import 'package:equatable/equatable.dart';

class StateEntity extends Equatable {
  final String id;
  final String name;
  final String imagePath;
  final String description;

  const StateEntity({
    required this.id,
    required this.name,
    required this.imagePath,
    this.description = '',
  });

  @override
  List<Object> get props => [id, name, imagePath, description];
}
