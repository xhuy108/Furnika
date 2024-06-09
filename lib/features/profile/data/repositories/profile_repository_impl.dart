import 'package:dartz/dartz.dart';

import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/errors/failures.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/auth/data/models/user_model.dart';
import 'package:furnika/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:furnika/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  const ProfileRepositoryImpl(this.remoteDataSource);

  final ProfileRemoteDataSource remoteDataSource;

  @override
  ResultFuture<UserModel> getCurrentUser() async {
    try {
      final result = await remoteDataSource.getCurrentUser();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<UserModel> updateProfile({
    required String username,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
  }) async {
    try {
      final result = await remoteDataSource.updateProfile(
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        gender: gender,
        birthday: birthday,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
