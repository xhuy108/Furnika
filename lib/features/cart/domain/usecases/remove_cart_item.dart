import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/cart/domain/repositories/cart_repository.dart';

class RemoveCartItem implements UseCaseWithParams<void, String> {
  final CartRepository repository;

  RemoveCartItem(this.repository);

  @override
  ResultFuture<void> call(String params) async {
    return await repository.removeProduct(productId: params);
  }
}
