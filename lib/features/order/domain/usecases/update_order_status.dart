import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/order/domain/repositories/order_repository.dart';

class UpdateOrderStatus
    implements UseCaseWithParams<void, UpdateOrderStatusParams> {
  final OrderRepository repository;

  UpdateOrderStatus(this.repository);

  @override
  ResultFuture<void> call(UpdateOrderStatusParams params) {
    return repository.updateOrderStatus(params.orderId, params.status);
  }
}

class UpdateOrderStatusParams {
  final String orderId;
  final String status;

  UpdateOrderStatusParams({
    required this.orderId,
    required this.status,
  });
}
