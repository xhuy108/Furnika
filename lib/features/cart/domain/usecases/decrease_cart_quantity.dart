import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/cart/domain/repositories/cart_repository.dart';

class DecreaseCartQuantity
    implements UseCaseWithParams<void, DecreaseCartQuantityParams> {
  final CartRepository repository;

  DecreaseCartQuantity(this.repository);

  @override
  ResultFuture<void> call(DecreaseCartQuantityParams params) async {
    return await repository.decreaseCartQuantity(product: params.product);
  }
}

class DecreaseCartQuantityParams extends Equatable {
  final Product product;

  const DecreaseCartQuantityParams({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}
