import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/cart/domain/repositories/cart_repository.dart';

class AddToCart implements UseCaseWithParams<void, AddToCartParams> {
  final CartRepository repository;

  AddToCart(this.repository);

  @override
  ResultFuture<void> call(AddToCartParams params) async {
    return await repository.addToCart(
      product: params.product,
      quantity: params.quantity,
      color: params.color,
    );
  }
}

class AddToCartParams extends Equatable {
  final Product product;
  final int quantity;
  final String color;

  const AddToCartParams({
    required this.product,
    required this.quantity,
    required this.color,
  });

  @override
  List<Object?> get props => [product, quantity, color];
}
