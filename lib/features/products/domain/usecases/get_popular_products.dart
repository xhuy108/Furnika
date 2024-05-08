import 'package:furnika/core/common/entities/product.dart';

import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';

import 'package:furnika/features/products/domain/repositories/product_repository.dart';

class GetPopularProducts implements UseCaseWithoutParams<List<Product>> {
  final ProductRepository _repository;

  GetPopularProducts(this._repository);

  @override
  ResultFuture<List<Product>> call() async =>
      await _repository.getPopularProducts();
}
