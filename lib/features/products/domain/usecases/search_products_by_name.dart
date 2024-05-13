import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/products/domain/repositories/product_repository.dart';

class SearchProductsByName implements UseCaseWithParams<List<Product>, String> {
  const SearchProductsByName(this.repository);

  final ProductRepository repository;

  @override
  ResultFuture<List<Product>> call(String params) {
    return repository.searchProductByName(params);
  }
}
