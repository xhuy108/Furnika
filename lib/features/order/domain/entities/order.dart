import 'package:equatable/equatable.dart';
import 'package:furnika/features/order/data/models/order_item_model.dart';
import 'package:furnika/features/profile/data/models/address_model.dart';

class OrderEntity extends Equatable {
  final String? id;
  final AddressModel shippingAddress;
  final String? user;
  final List<OrderItemModel> items;
  final int? totalQuantity;
  final int? totalPrice;
  final String paymentMethod;
  final int shippingPrice;
  final String? orderStatus;

  const OrderEntity({
    this.id,
    this.user,
    required this.shippingAddress,
    required this.items,
    this.totalQuantity,
    this.totalPrice,
    required this.paymentMethod,
    required this.shippingPrice,
    this.orderStatus,
  });

  @override
  List<Object> get props => [
        shippingAddress,
        items,
        paymentMethod,
        shippingPrice,
      ];
}
