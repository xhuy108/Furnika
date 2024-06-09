import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/order/data/models/order_model.dart';
import 'package:furnika/features/order/domain/repositories/order_repository.dart';

class PlaceOrder implements UseCaseWithParams<void, OrderModel> {
  final OrderRepository repository;

  PlaceOrder(this.repository);

  @override
  ResultFuture<void> call(OrderModel params) {
    return repository.placeOrder(params);
  }
}
