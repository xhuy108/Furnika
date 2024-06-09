import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/order/domain/entities/order.dart';
import 'package:furnika/features/order/domain/repositories/order_repository.dart';

class GetAllOrders implements UseCaseWithParams<List<OrderEntity>, String> {
  final OrderRepository repository;

  GetAllOrders(this.repository);

  @override
  ResultFuture<List<OrderEntity>> call(String params) {
    return repository.getAllOrders(params);
  }
}
