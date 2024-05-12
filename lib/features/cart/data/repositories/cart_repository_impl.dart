import 'package:dartz/dartz.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/errors/failures.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:furnika/features/cart/domain/entities/cart.dart';
import 'package:furnika/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  const CartRepositoryImpl(this.remoteDataSource);

  final CartRemoteDataSource remoteDataSource;

  @override
  ResultFuture<Cart> getCart() async {
    try {
      final result = await remoteDataSource.getCart();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> addToCart({
    required Product product,
    required int quantity,
    required String color,
  }) async {
    try {
      await remoteDataSource.addToCart(
        product: product,
        quantity: quantity,
        color: color,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> decreaseCartQuantity({required Product product}) async {
    try {
      await remoteDataSource.increaseCartQuantity(product: product);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> increaseCartQuantity({required Product product}) async {
    try {
      await remoteDataSource.decreaseCartQuantity(product: product);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> removeProduct({required String productId}) async {
    try {
      await remoteDataSource.removeCartItem(productId: productId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> emptyCart() async {
    try {
      await remoteDataSource.emptyCart();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
