import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:furnika/core/constraints/constraints.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/utils/injection_container.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileRemoteDataSource {
  const ProfileRemoteDataSource();

  Future<UserModel> getCurrentUser();
  Future<UserModel> updateProfile({
    required String username,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
  });
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await client.get(
      '$kBaseUrl/users/me',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
        },
      ),
    );
    final DataMap data = (response.data);
    if (response.statusCode == 200) {
      return UserModel.fromJson(data['data']);
    }

    throw ServerException(
      data['message'],
      response.statusCode!,
    );
  }

  @override
  Future<UserModel> updateProfile({
    required String username,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
  }) async {
    final response = await client.patch(
      '$kBaseUrl/users/updateMe',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
        },
      ),
      data: json.encode({
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'gender': gender.toUpperCase(),
        'birthday': birthday,
      }),
    );

    final DataMap data = (response.data);
    if (data['status'] == 'fail') {
      throw ServerException(
        data['message'],
        response.statusCode!,
      );
    }

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    }

    throw ServerException(
      data['message'],
      response.statusCode!,
    );
  }
}
