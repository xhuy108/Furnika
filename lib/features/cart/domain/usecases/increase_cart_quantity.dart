import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/features/cart/domain/repositories/cart_repository.dart';

import '../../../../core/utils/typedefs.dart';

class IncreaseCartQuantity
    implements UseCaseWithParams<void, IncreaseCartQuantityParams> {
  final CartRepository repository;

  IncreaseCartQuantity(this.repository);

  @override
  ResultFuture<void> call(IncreaseCartQuantityParams params) async {
    return await repository.increaseCartQuantity(product: params.product);
  }
}

class IncreaseCartQuantityParams extends Equatable {
  final Product product;

  const IncreaseCartQuantityParams({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}
