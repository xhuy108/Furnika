import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String icon;
  final String type;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        icon,
        type,
      ];
}
