import 'package:dartz/dartz.dart';

import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/errors/failures.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/products/data/models/product_model.dart';
import 'package:furnika/features/wishlist/data/datasources/wishlist_remote_datasource.dart';
import 'package:furnika/features/wishlist/domain/repositories/wishlist_repository.dart';

class WishlistRepositoryImpl extends WishlistRepository {
  const WishlistRepositoryImpl(this.remoteDataSource);

  final WishListRemoteDataSource remoteDataSource;

  @override
  ResultFuture<List<ProductModel>> getWishlist() async {
    try {
      final result = await remoteDataSource.getWishlist();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Product>> addOrRemoveProductFromWishlist(String id) async {
    try {
      final result = await remoteDataSource.addOrRemoveProductFromWishlist(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Product>> removeProductFromWishlist(String id) async {
    try {
      final result = await remoteDataSource.removeProductFromWishlist(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
