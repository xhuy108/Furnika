import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:furnika/features/auth/domain/entitties/user.dart';
import 'package:furnika/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required this.authRemoteDataSource});

  final AuthRemoteDataSource authRemoteDataSource;

  @override
  ResultFuture<User> logInWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement logInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  ResultFuture<User> signUp(
      {required String email,
      required String password,
      required String username,
      required String phoneNumber}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
