import 'package:dio/dio.dart';
import 'package:furnika/core/constraints/constraints.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/features/products/data/models/product_model.dart';

abstract interface class ProductRemoteDataSource {
  Future<List<ProductModel>> getPopularProducts();
  Future<List<ProductModel>> getProductsByCategory(String categoryId);
  Future<ProductModel> uploadProduct(ProductModel product);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio client;

  ProductRemoteDataSourceImpl(this.client);

  @override
  Future<List<ProductModel>> getPopularProducts() async {
    try {
      final response = await client.get(
        '$kBaseUrl/products',
        queryParameters: {
          'limit': 8,
        },
      );

      return response.data['data']
          .map<ProductModel>((category) => ProductModel.fromJson(category))
          .toList();
    } on DioException catch (dioException) {
      throw ServerException(
        dioException.response?.data['message'],
        dioException.response!.statusCode!,
      );
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }

  @override
  Future<ProductModel> uploadProduct(ProductModel product) {
    // TODO: implement uploadProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    try {
      final response =
          await client.get('$kBaseUrl/categories/$categoryId/products');

      return response.data['data']
          .map<ProductModel>((category) => ProductModel.fromJson(category))
          .toList();
    } on DioException catch (dioException) {
      throw ServerException(
        dioException.response?.data['message'],
        dioException.response!.statusCode!,
      );
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }
}
