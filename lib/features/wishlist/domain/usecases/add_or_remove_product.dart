import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/wishlist/domain/repositories/wishlist_repository.dart';

class AddOrRemoveProductFromWishlist
    implements UseCaseWithParams<List<Product>, String> {
  const AddOrRemoveProductFromWishlist(this.repository);

  final WishlistRepository repository;

  @override
  ResultFuture<List<Product>> call(String params) async {
    return await repository.addOrRemoveProductFromWishlist(params);
  }
}
