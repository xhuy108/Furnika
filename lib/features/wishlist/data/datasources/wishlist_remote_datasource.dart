import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:furnika/core/constraints/constraints.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/utils/injection_container.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/products/data/models/product_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class WishListRemoteDataSource {
  const WishListRemoteDataSource();

  Future<List<ProductModel>> getWishlist();
  Future<List<ProductModel>> addOrRemoveProductFromWishlist(String id);
  Future<List<ProductModel>> removeProductFromWishlist(String id);
}

class WishlistRemoteDataSourceImpl extends WishListRemoteDataSource {
  const WishlistRemoteDataSourceImpl({required this.client});

  final Dio client;
  @override
  Future<List<ProductModel>> getWishlist() async {
    try {
      final response = await client.get(
        '$kBaseUrl/users/wishlist',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
      );
      final DataMap data = (response.data);
      //print(data['data']['wishlist']);
      final List<ProductModel> products = [];
      if (response.statusCode == 200) {
        for (final product in data['data']['wishlist']) {
          //print(product);
          products.add(
            ProductModel.fromJson(product),
          );
        }
        //print(products);
        return products;
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
  Future<List<ProductModel>> addOrRemoveProductFromWishlist(String id) async {
    try {
      final response = await client.patch(
        '$kBaseUrl/products/$id/wishlist',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
      );
      final DataMap data = (response.data);
      final List<ProductModel> products = [];
      if (response.statusCode == 200) {
        for (final product in data['data']['data']['wishlist']) {
          products.add(
            ProductModel.fromJson(product),
          );
        }
        return products;
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
  Future<List<ProductModel>> removeProductFromWishlist(String id) async {
    try {
      final response = await client.patch(
        '$kBaseUrl/products/$id/deleteFromWishlist',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
      );
      final DataMap data = (response.data);
      final List<ProductModel> products = [];
      if (response.statusCode == 200) {
        for (final product in data['data']['data']['wishlist']) {
          products.add(
            ProductModel.fromJson(product),
          );
        }
        return products;
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
