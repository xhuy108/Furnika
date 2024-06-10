import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:furnika/core/constraints/constraints.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/utils/injection_container.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/order/data/models/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OrderRemoteDataSource {
  const OrderRemoteDataSource();

  Future<void> placeOrder(OrderModel order);
  Future<void> placeDiscountOrder(OrderModel order, double totalPrice);
  Future<List<OrderModel>> getAllOrders(String query);
  Future<void> updateOrderStatus(String orderId, String status);
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  const OrderRemoteDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<void> placeOrder(OrderModel order) async {
    final url = '$kBaseUrl/orders';
    try {
      final response = await client.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
        data: order.toJson(),
      );

      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }

  @override
  Future<List<OrderModel>> getAllOrders(String query) async {
    final url = '$kBaseUrl/orders?$query&sort=-updatedAt';
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

      if (response.statusCode == 200) {
        return data['data']['data']
            .map<OrderModel>((e) => OrderModel.fromMap(e))
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
  Future<void> updateOrderStatus(String orderId, String status) async {
    final url = '$kBaseUrl/orders/$orderId';
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
        data: json.encode({
          'orderStatus': status,
        }),
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

  @override
  Future<void> placeDiscountOrder(OrderModel order, double totalPrice) async {
    const url = '$kBaseUrl/orders';
    try {
      final response = await client.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ${sl<SharedPreferences>().getString(kAccessToken)}',
          },
        ),
        data: json.encode({
          ...order.toMap(),
          'totalPrice': totalPrice,
        }),
      );

      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }
}
