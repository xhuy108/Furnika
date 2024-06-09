import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/order/data/models/order_model.dart';
import 'package:furnika/features/order/domain/entities/order.dart';

abstract class OrderRepository {
  const OrderRepository();

  ResultFuture<void> placeOrder(OrderModel order);
  ResultFuture<void> placeDiscountOrder(OrderModel order, int totalPrice);
  ResultFuture<List<OrderEntity>> getAllOrders(String query);
  ResultFuture<void> updateOrderStatus(String orderId, String status);
}
