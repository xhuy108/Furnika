import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/cart/domain/entities/cart.dart';
import 'package:furnika/features/cart/domain/repositories/cart_repository.dart';

class GetCart implements UseCaseWithoutParams<Cart> {
  final CartRepository repository;

  GetCart(this.repository);

  @override
  ResultFuture<Cart> call() async {
    return await repository.getCart();
  }
}
