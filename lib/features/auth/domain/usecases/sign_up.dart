import 'package:equatable/equatable.dart';

import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/auth/domain/entitties/user.dart';

import 'package:furnika/features/auth/domain/repositories/auth_repository.dart';

class SignUp implements UseCaseWithParams<User, SignUpParams> {
  final AuthRepository _repository;

  SignUp(this._repository);

  @override
  ResultFuture<User> call(SignUpParams params) async =>
      await _repository.signUp(
        email: params.email,
        password: params.password,
        username: params.username,
      );
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.username,
  });

  final String email;
  final String password;
  final String username;

  @override
  List<Object?> get props => [email, password, username];
}
