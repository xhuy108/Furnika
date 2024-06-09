import 'package:dartz/dartz.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/errors/failures.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/profile/data/datasources/address_remote_datasource.dart';
import 'package:furnika/features/profile/data/models/address_model.dart';
import 'package:furnika/features/profile/domain/entities/address.dart';
import 'package:furnika/features/profile/domain/repositories/address_repository.dart';

class AddressRepositoryImpl extends AddressRepository {
  final AddressRemoteDataSource remoteDataSource;

  const AddressRepositoryImpl(
    this.remoteDataSource,
  );

  @override
  ResultFuture<List<AddressModel>> getAllAddresses() async {
    try {
      final result = await remoteDataSource.getAllAddresses();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<AddressModel> getDefaultAddress() async {
    try {
      final result = await remoteDataSource.getDefaultAddress();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> addAddress(AddressModel address) async {
    try {
      print('address');
      await remoteDataSource.addAddress(address);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> deleteAddress(Address address) {
    // TODO: implement deleteAddress
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> updateAddress(AddressModel address) async {
    try {
      await remoteDataSource.updateAddress(address);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
