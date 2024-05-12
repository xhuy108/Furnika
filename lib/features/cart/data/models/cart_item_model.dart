import 'package:furnika/features/cart/domain/entities/cart_item_entity.dart';
import 'package:furnika/features/products/data/models/product_model.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.id,
    required super.product,
    required super.quantity,
    required super.price,
    required super.color,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json['_id'] as String,
        product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
        quantity: json['quantity'] as int,
        price: json['price'] as double,
        color: json['color'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product,
        'quantity': quantity,
        'price': price,
        'color': color,
      };
}
