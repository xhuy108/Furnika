import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/cubits/app_user/app_user_cubit.dart';

import 'package:furnika/core/common/entities/user.dart';
import 'package:furnika/features/auth/domain/usecases/cache_first_time.dart';
import 'package:furnika/features/auth/domain/usecases/log_in.dart';
import 'package:furnika/features/auth/domain/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUp _signUp;
  final LogInWithEmailAndPassword _logInWithEmailAndPassword;
  final AppUserCubit _appUserCubit;
  final CacheFirstTime _cacheFirstTime;

  AuthBloc({
    required SignUp signUp,
    required LogInWithEmailAndPassword logInWithEmailAndPassword,
    required AppUserCubit appUserCubit,
    required CacheFirstTime cacheFirstTime,
  })  : _signUp = signUp,
        _logInWithEmailAndPassword = logInWithEmailAndPassword,
        _appUserCubit = appUserCubit,
        _cacheFirstTime = cacheFirstTime,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthInitial()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogIn);
    on<AuthCacheFirstTime>(_onAuthCacheFirstTime);
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
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthLogIn(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result =
        await _logInWithEmailAndPassword(LogInWithEmailAndPasswordParams(
      email: event.email,
      password: event.password,
    ));

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }

  void _onAuthCacheFirstTime(
      AuthCacheFirstTime event, Emitter<AuthState> emit) {
    _cacheFirstTime();
  }
}
