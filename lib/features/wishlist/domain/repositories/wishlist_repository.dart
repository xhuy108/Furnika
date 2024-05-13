import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/utils/typedefs.dart';

abstract class WishlistRepository {
  const WishlistRepository();

  ResultFuture<List<Product>> getWishlist();
  ResultFuture<List<Product>> addOrRemoveProductFromWishlist(String id);
  ResultFuture<List<Product>> removeProductFromWishlist(String id);
}
