import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/cart/domain/repositories/cart_repository.dart';

class EmptyCart implements UseCaseWithoutParams<void> {
  final CartRepository repository;

  const EmptyCart(this.repository);

  @override
  ResultFuture<void> call() async {
    return await repository.emptyCart();
  }
}
