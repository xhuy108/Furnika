import 'package:equatable/equatable.dart';

import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/core/common/entities/user.dart';

import 'package:furnika/features/auth/domain/repositories/auth_repository.dart';

class LogInWithEmailAndPassword
    implements UseCaseWithParams<User, LogInWithEmailAndPasswordParams> {
  final AuthRepository _repository;

  LogInWithEmailAndPassword(this._repository);

  @override
  ResultFuture<User> call(LogInWithEmailAndPasswordParams params) async =>
      await _repository.logInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
}

class LogInWithEmailAndPasswordParams extends Equatable {
  const LogInWithEmailAndPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
