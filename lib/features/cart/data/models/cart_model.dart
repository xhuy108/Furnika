import 'package:furnika/features/cart/data/models/cart_item_model.dart';
import 'package:furnika/features/cart/domain/entities/cart.dart';
import 'package:furnika/features/cart/domain/entities/cart_item_entity.dart';

class CartModel extends Cart {
  const CartModel({
    required super.id,
    required super.items,
    required super.cartTotalQuantity,
    required super.cartTotalPrice,
    super.totalPriceAfterDiscount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['_id'] as String,
        items: json['items'].map<CartItemEntity>((e) {
          return CartItemModel.fromJson(e);
        }).toList(),
        cartTotalPrice: json['cartTotalPrice'] as double,
        cartTotalQuantity: json['cartTotalQuantity'] as int,
        totalPriceAfterDiscount: json['totalPriceAfterDiscount'] as int,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        // 'items': items,
        'cartTotalPrice': cartTotalPrice,
        'cartTotalQuantity': cartTotalQuantity,
        'totalPriceAfterDiscount': totalPriceAfterDiscount,
      };
}
