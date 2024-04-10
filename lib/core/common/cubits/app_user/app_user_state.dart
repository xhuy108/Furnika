part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState extends Equatable {
  const AppUserState();

  @override
  List<Object> get props => [];
}

final class AppUserInitial extends AppUserState {}

final class AppUserLoggedIn extends AppUserState {
  const AppUserLoggedIn({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}
