import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  const AuthRemoteDataSourceImpl({
    required this.client,
    required this.sharedPreferences,
  });

  final Dio client;
  final SharedPreferences sharedPreferences;

  @override
  Future<UserModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.post(
        '/users/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return UserModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
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
