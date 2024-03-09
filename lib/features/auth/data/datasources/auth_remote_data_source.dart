import 'package:furnika/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  });

  // Future<void> logInWithGoogle();

  // Future<void> logInWithFacebook();

  // Future<void> forgotPassword(String email);

  // Future<void> updateUser({
  //   required UserInfo userInfo,
  //   dynamic userData,
  // });

  // Future<void> signOut();

  // Future<String> getUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl();

  // final http.Client client;

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
    required String phoneNumber,
  }) async {
    return const UserModel(
      id: '1',
      userName: 'username',
      phoneNumber: '1234567890',
      email: 'email',
    );
  }
}
