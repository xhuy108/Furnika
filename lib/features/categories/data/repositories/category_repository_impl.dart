import 'package:dartz/dartz.dart';
import 'package:furnika/core/common/entities/category.dart';
import 'package:furnika/core/errors/exceptions.dart';
import 'package:furnika/core/errors/failures.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:furnika/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:furnika/core/common/entities/user.dart';
import 'package:furnika/features/auth/domain/repositories/auth_repository.dart';
import 'package:furnika/features/categories/data/datasources/category_remote_datasource.dart';
import 'package:furnika/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl({
    required this.remoteDataSource,
  });

  final CategoryRemoteDataSource remoteDataSource;

  @override
  ResultFuture<List<Category>> getAllCategories() async {
    try {
      final categories = await remoteDataSource.getAllCategories();

      return Right(categories);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Category>> getOtherCategories() async {
    try {
      final categories = await remoteDataSource.getOtherCategories();

      return Right(categories);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Category>> getPopularCategories() async {
    try {
      final categories = await remoteDataSource.getPopularCategories();

      return Right(categories);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
