import 'dart:convert';

import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/order/data/models/order_item_model.dart';
import 'package:furnika/features/order/domain/entities/order.dart';
import 'package:furnika/features/profile/data/models/address_model.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    super.id,
    required super.items,
    required super.shippingAddress,
    super.user,
    super.orderStatus,
    required super.paymentMethod,
    required super.shippingPrice,
    super.totalPrice,
    super.totalQuantity,
  });

  OrderModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          shippingAddress: AddressModel.fromMap(map['shippingAddress']),
          items: List<OrderItemModel>.from(
              map['items'].map((item) => OrderItemModel.fromMap(item))),
          user: map['user'] as String,
          orderStatus: map['orderStatus'] as String,
          paymentMethod: map['paymentMethod'] as String,
          shippingPrice: map['shippingPrice'] as int,
          totalPrice: map['totalPrice'] as int,
          totalQuantity: map['totalQuantity'] as int,
        );

  DataMap toMap() => {
        'items': List<dynamic>.from(items.map((item) => item.toMap())),
        'shippingAddress': shippingAddress.toMap(),
        'paymentMethod': paymentMethod,
        'shippingPrice': shippingPrice,
      };

  String toJson() => jsonEncode(toMap());

  OrderModel copyWith({
    String? id,
    List<OrderItemModel>? items,
    AddressModel? shippingAddress,
    String? orderStatus,
    String? paymentMethod,
    String? user,
    int? shippingPrice,
    int? totalPrice,
    int? totalQuantity,
  }) {
    return OrderModel(
      id: id ?? this.id,
      items: items ?? this.items,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      user: user ?? this.user,
      shippingPrice: shippingPrice ?? this.shippingPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      totalQuantity: totalQuantity ?? this.totalQuantity,
    );
  }
}
