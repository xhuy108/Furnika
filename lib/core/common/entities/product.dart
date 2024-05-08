import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageCover;
  final List<String> images;
  final List<String> category;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageCover,
    required this.images,
    required this.category,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        images,
        category,
        imageCover,
      ];
}
