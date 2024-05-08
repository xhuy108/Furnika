import 'package:dio/dio.dart';
import 'package:furnika/features/products/data/models/product_model.dart';

abstract interface class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> uploadProduct(ProductModel product);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio client;

  ProductRemoteDataSourceImpl(this.client);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    throw UnimplementedError();
    // final response = await client.get(
    //   Uri.parse('https://furnika-1f3e4-default-rtdb.firebaseio.com/products.json'),
    // );

    // if (response.statusCode == 200) {
    //   final List<ProductModel> products = [];
    //   final Map<String, dynamic> data = json.decode(response.body);
    //   data.forEach((key, value) {
    //     products.add(ProductModel.fromJson(value));
    //   });
    //   return products;
    // } else {
    //   throw ServerException();
    // }
  }

  @override
  Future<ProductModel> uploadProduct(ProductModel product) async {
    throw UnimplementedError();
  }
}
