import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/core/common/entities/user.dart';

abstract interface class AuthRepository {
  const AuthRepository();

  ResultFuture<User> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  ResultFuture<User> signUp({
    required String email,
    required String password,
    required String username,
  });

  // ResultFuture<void> forgotPassword(String email);

  // ResultFuture<void> signOut();
}
