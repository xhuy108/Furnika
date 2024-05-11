import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/utils/typedefs.dart';

abstract interface class ProductRepository {
  ResultFuture<List<Product>> getPopularProducts();
  ResultFuture<List<Product>> getProductsByCategory(String categoryId);
  ResultFuture<Product> uploadProduct(Product product);
}
