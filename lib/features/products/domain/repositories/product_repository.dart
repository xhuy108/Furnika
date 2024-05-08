import 'package:furnika/core/common/entities/product.dart';

abstract interface class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> uploadProduct(Product product);
}
