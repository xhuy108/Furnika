import 'package:furnika/core/constraints/constraints.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:furnika/features/categories/data/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<CategoryModel>> getPopularCategories();
  Future<List<CategoryModel>> getOtherCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  const CategoryRemoteDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await client.get(
        '$kBaseUrl/categories',
        queryParameters: {
          'sort': 'name',
        },
      );

      return response.data['data']
          .map<CategoryModel>((category) => CategoryModel.fromJson(category))
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
  Future<List<CategoryModel>> getOtherCategories() async {
    try {
      final response = await client.get('$kBaseUrl/categories/otherCategories');

      return response.data['data']
          .map<CategoryModel>((category) => CategoryModel.fromJson(category))
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
  Future<List<CategoryModel>> getPopularCategories() async {
    try {
      final response =
          await client.get('$kBaseUrl/categories/popularCategories');

      return response.data['data']
          .map<CategoryModel>((category) => CategoryModel.fromJson(category))
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
