import 'dart:convert';

import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/order/domain/entities/order_item.dart';
import 'package:furnika/features/products/data/models/product_model.dart';

class OrderItemModel extends OrderItem {
  const OrderItemModel({
    required super.id,
    required super.product,
    required super.price,
    required super.color,
    required super.quantity,
  });

  factory OrderItemModel.fromJson(String source) =>
      OrderItemModel.fromMap(jsonDecode(source) as DataMap);

  OrderItemModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          product: ProductModel.fromJson(map['product']),
          price: map['price'] as double,
          quantity: map['quantity'] as int,
          color: map['color'] as String,
        );

  DataMap toMap() => {
        'product': product.id,
        'price': price,
        'quantity': quantity,
        'color': color,
      };

  String toJson() => jsonEncode(toMap());

  // OrderItemModel copyWith({
  //   String? id,
  //   String? customer,
  //   String? phoneNumber,
  //   String? detailedAddress,
  //   String? district,
  //   String? city,
  //   String? country,
  // }) {
  //   return OrderItemModel(
  //     id: id ?? this.id,
  //     customer: customer ?? this.customer,
  //     phoneNumber: phoneNumber ?? this.phoneNumber,
  //     detailedAddress: detailedAddress ?? this.detailedAddress,
  //     district: district ?? this.district,
  //     city: city ?? this.city,
  //     country: country ?? this.country,
  //   );
  // }
}
