import 'package:furnika/core/common/entities/category.dart';
import 'package:furnika/core/utils/typedefs.dart';

abstract interface class CategoryRepository {
  const CategoryRepository();

  ResultFuture<List<Category>> getAllCategories();
  ResultFuture<List<Category>> getPopularCategories();
  ResultFuture<List<Category>> getOtherCategories();
}
