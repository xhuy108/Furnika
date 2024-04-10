import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String username,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this.client);

  final Dio client;

  @override
  Future<UserModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return const UserModel(
      id: '1',
      userName: 'username',
      phoneNumber: '1234567890',
      email: 'email',
    );
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final response = await client.post(
        '/users/signup',
        data: {
          'email': email,
          'password': password,
          'username': username,
        },
      );

      return UserModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }
}
