import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/features/products/data/datasources/product_remote_data_source.dart';
import 'package:furnika/features/products/data/models/product_model.dart';
import 'package:furnika/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getAllProducts() async {
    final products = await remoteDataSource.getAllProducts();
    return products;
  }

  @override
  Future<Product> uploadProduct(ProductModel product) async {
    final uploadedProduct = await remoteDataSource.uploadProduct(product);
    return uploadedProduct;
  }
}