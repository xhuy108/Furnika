import 'package:furnika/core/common/entities/product.dart';

import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';

import 'package:furnika/features/products/domain/repositories/product_repository.dart';

class GetProductsByCategory
    implements UseCaseWithParams<List<Product>, String> {
  final ProductRepository _repository;

  GetProductsByCategory(this._repository);

  @override
  ResultFuture<List<Product>> call(String params) async =>
      await _repository.getProductsByCategory(params);
}
