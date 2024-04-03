import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:furnika/features/auth/domain/entitties/user.dart';
import 'package:furnika/features/auth/domain/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUp _signUp;

  AuthBloc({required SignUp signUp})
      : _signUp = signUp,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await _signUp(SignUpParams(
      email: event.email,
      password: event.password,
      username: event.username,
    ));

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
