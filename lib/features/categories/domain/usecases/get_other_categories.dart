import 'package:furnika/core/common/entities/category.dart';

import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';

import 'package:furnika/features/categories/domain/repositories/category_repository.dart';

class GetOtherCategories implements UseCaseWithoutParams<List<Category>> {
  final CategoryRepository _repository;

  GetOtherCategories(this._repository);

  @override
  ResultFuture<List<Category>> call() async =>
      await _repository.getOtherCategories();
}
