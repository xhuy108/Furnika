part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignUp extends AuthEvent {
  const AuthSignUp({
    required this.email,
    required this.password,
    required this.username,
  });

  final String email;
  final String password;
  final String username;

  @override
  List<Object> get props => [email, password, username];
}

final class AuthLogin extends AuthEvent {
  const AuthLogin({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

final class AuthLogout extends AuthEvent {
  const AuthLogout();
}

final class AuthCacheFirstTime extends AuthEvent {
  const AuthCacheFirstTime();
}
