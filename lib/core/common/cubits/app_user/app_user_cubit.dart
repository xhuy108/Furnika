import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furnika/core/common/entities/user.dart';
import 'package:furnika/core/constraints/constraints.dart';
import 'package:furnika/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  AppUserCubit({required this.dio, required this.sharedPreferences})
      : super(AppUserInitial());

  void updateUser(User? user) {
    if (user == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn(user: user));
    }
  }

  void login() async {
    if (sharedPreferences.getString(kAccessToken) == null) {
      emit(AppUserInitial());
      return;
    }

    final response = await dio.get(
      '$kBaseUrl/users/me',
      options: Options(
        headers: {
          'Authorization':
              'Bearer ${sharedPreferences.getString(kAccessToken)}',
        },
      ),
    );

    if (response.statusCode == 200) {
      emit(AppUserLoggedIn(user: UserModel.fromJson(response.data['data'])));
    } else {
      emit(AppUserInitial());
    }
  }

  void logout() {
    emit(AppUserInitial());
  }
}
