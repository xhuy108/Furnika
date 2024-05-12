import 'package:dartz/dartz.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/errors/failures.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/products/data/datasources/product_remote_data_source.dart';
import 'package:furnika/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  ResultFuture<List<Product>> getPopularProducts() async {
    try {
      final products = await remoteDataSource.getPopularProducts();

      return Right(products);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Product> uploadProduct(Product product) async {
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<Product>> getProductsByCategory(String categoryId) async {
    try {
      final products = await remoteDataSource.getProductsByCategory(categoryId);

      return Right(products);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
