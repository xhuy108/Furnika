import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/wishlist/domain/repositories/wishlist_repository.dart';

class GetWishlist implements UseCaseWithoutParams<List<Product>> {
  const GetWishlist(this.repository);

  final WishlistRepository repository;

  @override
  ResultFuture<List<Product>> call() async {
    return await repository.getWishlist();
  }
}
