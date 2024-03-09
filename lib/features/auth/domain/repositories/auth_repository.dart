import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/auth/domain/entitties/user.dart';

abstract interface class AuthRepository {
  const AuthRepository();

  ResultFuture<User> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  // ResultFuture<void> logInWithGoogle();

  // ResultFuture<void> logInWithFacebook();

  ResultFuture<User> signUp({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  });

  // ResultFuture<void> forgotPassword(String email);

  // ResultFuture<void> updateUser({
  //   required UserInfo userInfo,
  //   dynamic userData,
  // });

  // ResultFuture<void> signOut();

  // ResultFuture<String> getUser();
}
