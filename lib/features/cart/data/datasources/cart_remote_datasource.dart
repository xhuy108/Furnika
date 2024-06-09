import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/constraints/constraints.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/utils/injection_container.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/cart/data/models/cart_model.dart';
import 'package:furnika/features/cart/domain/entities/cart_item_entity.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class CartRemoteDataSource {
  const CartRemoteDataSource();

  Future<CartModel> getCart();

  Future<void> addToCart({
    required Product product,
    required int quantity,
    required String color,
  });

  Future<void> increaseCartQuantity({
    required Product product,
  });

  Future<void> decreaseCartQuantity({
    required Product product,
  });

  Future<void> removeCartItem({
    required String productId,
  });

  Future<void> emptyCart();
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  const CartRemoteDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<CartModel> getCart() async {
    try {
      final response = await client.get(
        '$kBaseUrl/carts',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
      );
      final data = response.data;

      if (data['data']['data'].isEmpty) {
        return CartModel(
          id: DateTime.now().toString(),
          items: <CartItemEntity>[],
          cartTotalPrice: 0,
          cartTotalQuantity: 0,
        );
      }

      if (response.statusCode == 200) {
        return CartModel.fromJson(data['data']['data'][0]);
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
  Future<void> addToCart(
      {required Product product,
      required int quantity,
      required String color}) async {
    try {
      final response = await client.post(
        '$kBaseUrl/carts',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
        data: jsonEncode({
          'product': product.id,
          'quantity': quantity,
          'color': color,
        }),
      );
      final DataMap data = (response.data);

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
  Future<void> decreaseCartQuantity({required Product product}) async {
    try {
      final response = await client.patch(
        '$kBaseUrl/carts/increase',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
        data: jsonEncode({
          'product': product.id,
        }),
      );
      final DataMap data = (response.data);

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
  Future<void> increaseCartQuantity({required Product product}) async {
    try {
      final response = await client.patch(
        '$kBaseUrl/carts/decrease',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
        data: jsonEncode({
          'product': product.id,
        }),
      );
      final DataMap data = (response.data);

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
  Future<void> removeCartItem({required String productId}) async {
    try {
      final response = await client.patch(
        '$kBaseUrl/carts/delete',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
        data: jsonEncode({
          'product': productId,
        }),
      );
      final DataMap data = (response.data);

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
  Future<void> emptyCart() async {
    try {
      final response = await client.patch(
        '$kBaseUrl/carts/empty',
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
