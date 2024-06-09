import 'dart:convert';

import 'package:furnika/core/constraints/constraints.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/utils/injection_container.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/profile/data/models/address_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddressRemoteDataSource {
  const AddressRemoteDataSource();

  Future<List<AddressModel>> getAllAddresses();
  Future<AddressModel> getDefaultAddress();
  Future<void> addAddress(AddressModel address);
  Future<void> updateAddress(AddressModel address);
}

class AddressRemoteDataSourceImpl extends AddressRemoteDataSource {
  const AddressRemoteDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<List<AddressModel>> getAllAddresses() async {
    const url = '$kBaseUrl/addresses?sort=createdAt';
    try {
      final response = await client.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
      );
      final DataMap data = response.data;

      if (response.statusCode == 200) {
        return data['data']['data']
            .map<AddressModel>((e) => AddressModel.fromMap(e))
            .toList();
      }

      throw ServerException(
        data['message'],
        response.statusCode!,
      );
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }

  @override
  Future<AddressModel> getDefaultAddress() async {
    const url = '$kBaseUrl/addresses?isDefault=true';
    try {
      final response = await client.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
      );
      final DataMap data = jsonDecode(response.data);

      if (data['data']['data'].isEmpty) {
        throw const ServerException('No default address', 404);
      }

      if (response.statusCode == 200) {
        return AddressModel.fromMap(data['data']['data'][0]);
      }

      throw ServerException(
        data['message'],
        response.statusCode!,
      );
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }

  @override
  Future<void> addAddress(AddressModel address) async {
    print('address: $address');
    const url = '$kBaseUrl/addresses';
    try {
      final response = await client.post(
        url,
        data: json.encode({
          'customer': address.customer,
          'phoneNumber': address.phoneNumber,
          'detailedAddress': address.detailedAddress,
          'district': address.district,
          'city': address.city,
          'country': address.country,
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
      );
      final DataMap data = jsonDecode(response.data);

      if (data['data']['data'].isEmpty) {
        throw const ServerException('No default address', 404);
      }

      if (response.statusCode == 200) {
        return;
      }

      throw ServerException(
        data['message'],
        response.statusCode!,
      );
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }

  @override
  Future<void> updateAddress(AddressModel address) async {
    final url = '$kBaseUrl/addresses/${address.id}';
    try {
      final response = await client.patch(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
        data: json.encode(
          {
            'customer': address.customer,
            'phoneNumber': address.phoneNumber,
            'detailedAddress': address.detailedAddress,
            'district': address.district,
            'city': address.city,
            'country': address.country,
          },
        ),
      );
      final DataMap data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        return;
      }

      throw ServerException(
        data['message'],
        response.statusCode!,
      );
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }
}
