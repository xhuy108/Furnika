import 'package:equatable/equatable.dart';
import 'package:furnika/features/cart/domain/entities/cart_item_entity.dart';

class Cart extends Equatable {
  final String id;
  final List<CartItemEntity> items;
  final int cartTotalQuantity;
  final double cartTotalPrice;
  final int? totalPriceAfterDiscount;

  const Cart({
    required this.id,
    required this.items,
    required this.cartTotalPrice,
    this.totalPriceAfterDiscount,
    required this.cartTotalQuantity,
  });

  Cart copyWith({
    String? id,
    List<CartItemEntity>? items,
    int? cartTotalQuantity,
    double? cartTotalPrice,
    int? totalPriceAfterDiscount,
  }) {
    return Cart(
      id: id ?? this.id,
      items: items ?? this.items,
      cartTotalQuantity: cartTotalQuantity ?? this.cartTotalQuantity,
      cartTotalPrice: cartTotalPrice ?? this.cartTotalPrice,
      totalPriceAfterDiscount:
          totalPriceAfterDiscount ?? this.totalPriceAfterDiscount,
    );
  }

  @override
  List<Object> get props => [id, cartTotalPrice];
}
