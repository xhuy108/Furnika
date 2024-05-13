import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/product.dart';
import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/products/domain/repositories/product_repository.dart';

class SearchProductsByNamePerCategory
    implements
        UseCaseWithParams<List<Product>,
            SearchProductsByNamePerCategoryParams> {
  const SearchProductsByNamePerCategory(this.repository);

  final ProductRepository repository;

  @override
  ResultFuture<List<Product>> call(
      SearchProductsByNamePerCategoryParams params) {
    return repository.searchProductsByNamePerCategory(
        params.categoryId, params.text);
  }
}

class SearchProductsByNamePerCategoryParams extends Equatable {
  const SearchProductsByNamePerCategoryParams({
    required this.categoryId,
    required this.text,
  });

  final String categoryId;
  final String text;

  @override
  List<Object?> get props => [categoryId, text];
}
