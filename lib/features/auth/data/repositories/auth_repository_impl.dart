import 'package:dartz/dartz.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/errors/failures.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:furnika/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:furnika/core/common/entities/user.dart';
import 'package:furnika/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  @override
  ResultFuture<User> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.logInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final user = await remoteDataSource.signUp(
        email: email,
        password: password,
        username: username,
      );

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> cacheFirstTime() async {
    try {
      await localDataSource.cacheFirstTime();

      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
