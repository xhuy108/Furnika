import 'package:equatable/equatable.dart';
import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/order/data/models/order_model.dart';
import 'package:furnika/features/order/domain/repositories/order_repository.dart';

class PlaceDiscountOrder
    implements UseCaseWithParams<void, PlaceDiscountOrderParams> {
  final OrderRepository repository;

  PlaceDiscountOrder(this.repository);

  @override
  ResultFuture<void> call(PlaceDiscountOrderParams params) {
    return repository.placeDiscountOrder(params.order, params.totalPrice);
  }
}

class PlaceDiscountOrderParams extends Equatable {
  final OrderModel order;
  final double totalPrice;

  const PlaceDiscountOrderParams({
    required this.order,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [order, totalPrice];
}
