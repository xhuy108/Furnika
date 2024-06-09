import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/features/order/data/models/order_item_model.dart';
import 'package:furnika/features/order/data/models/order_model.dart';
import 'package:furnika/features/order/domain/entities/order.dart';
import 'package:furnika/features/order/domain/usecases/create_discount_order.dart';
import 'package:furnika/features/order/domain/usecases/create_order.dart';
import 'package:furnika/features/order/domain/usecases/get_all_order.dart';
import 'package:furnika/features/order/domain/usecases/update_order_status.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final PlaceOrder placeOrder;
  final PlaceDiscountOrder placeDiscountOrder;
  final GetAllOrders getAllOrders;
  final UpdateOrderStatus updateOrderStatus;

  OrderCubit({
    required this.placeOrder,
    required this.placeDiscountOrder,
    required this.getAllOrders,
    required this.updateOrderStatus,
  }) : super(const OrderState());

  void addOrderItem(List<OrderItemModel> items) {
    int totalOrderPrice = 0;
    for (var orderItem in items) {
      totalOrderPrice += orderItem.price * orderItem.quantity;
    }
    emit(
      state.copyWith(
        orderItems: [...items],
        totalOrderPrice: totalOrderPrice,
      ),
    );
  }

  void createOrder(OrderModel order) async {
    await placeOrder(order);
  }

  void createDiscountOrder(OrderModel order, int totalPrice) async {
    await placeDiscountOrder(
      PlaceDiscountOrderParams(
        order: order,
        totalPrice: totalPrice,
      ),
    );
  }

  void emptyOrder() {
    emit(
      state.copyWith(
        orderItems: [],
        totalOrderPrice: 0,
      ),
    );
  }

  void fetchAllOrders(String query) async {
    emit(state.copyWith(orderStatus: OrderStatus.loading));
    final result = await getAllOrders.call(query);
    result.fold(
      (failure) => emit(
        state.copyWith(
          orderStatus: OrderStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (orders) => emit(
        state.copyWith(
          orderStatus: OrderStatus.loaded,
          orders: orders,
        ),
      ),
    );
  }

  void informOrderStatus(String orderId, String status) async {
    await updateOrderStatus.call(
      UpdateOrderStatusParams(
        orderId: orderId,
        status: status,
      ),
    );
  }
}
