part of 'order_cubit.dart';

enum OrderStatus { initial, loading, loaded, error }

class OrderState {
  final List<OrderEntity> orders;
  final OrderStatus orderStatus;
  final List<OrderItemModel> orderItems;
  final int totalOrderPrice;
  final OrderStatus orderItemStatus;
  final String errorMessage;

  const OrderState({
    this.orders = const [],
    this.orderStatus = OrderStatus.initial,
    this.orderItems = const [],
    this.totalOrderPrice = 0,
    this.orderItemStatus = OrderStatus.initial,
    this.errorMessage = '',
  });

  OrderState copyWith({
    List<OrderEntity>? orders,
    OrderStatus? orderStatus,
    List<OrderItemModel>? orderItems,
    OrderStatus? orderItemStatus,
    String? errorMessage,
    int? totalOrderPrice,
  }) {
    return OrderState(
      orders: orders ?? this.orders,
      orderStatus: orderStatus ?? this.orderStatus,
      orderItems: orderItems ?? this.orderItems,
      orderItemStatus: orderItemStatus ?? this.orderItemStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      totalOrderPrice: totalOrderPrice ?? this.totalOrderPrice,
    );
  }
}
