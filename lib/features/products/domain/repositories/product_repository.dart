import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/utils/typedefs.dart';

abstract interface class ProductRepository {
  ResultFuture<List<Product>> getPopularProducts();
  ResultFuture<Product> uploadProduct(Product product);
}
