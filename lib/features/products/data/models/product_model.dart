import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/features/categories/data/models/category_model.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.images,
    required super.imageCover,
    required super.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      images: List<String>.from(json['images']),
      imageCover: json['imageCover'],
      category: List<CategoryModel>.from(
          json['category'].map((x) => CategoryModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'images': images,
      'imageCover': imageCover,
    };
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    List<String>? images,
    String? imageCover,
    List<CategoryModel>? category,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      images: images ?? this.images,
      imageCover: imageCover ?? this.imageCover,
      category: category ?? this.category,
    );
  }
}
