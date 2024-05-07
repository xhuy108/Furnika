import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/features/products/data/models/product_model.dart';

abstract interface class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> uploadProduct(ProductModel product);
}
