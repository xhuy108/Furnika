import 'package:dartz/dartz.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/errors/failures.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/order/data/datasources/order_remote_datasource.dart';
import 'package:furnika/features/order/data/models/order_model.dart';
import 'package:furnika/features/order/domain/entities/order.dart';
import 'package:furnika/features/order/domain/repositories/order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  const OrderRepositoryImpl(
    this.remoteDataSource,
  );

  @override
  ResultFuture<void> placeOrder(OrderModel order) async {
    try {
      await remoteDataSource.placeOrder(order);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<OrderEntity>> getAllOrders(String query) async {
    try {
      final result = await remoteDataSource.getAllOrders(query);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> updateOrderStatus(String orderId, String status) async {
    try {
      await remoteDataSource.updateOrderStatus(orderId, status);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> placeDiscountOrder(
      OrderModel order, int totalPrice) async {
    try {
      await remoteDataSource.placeDiscountOrder(order, totalPrice);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
