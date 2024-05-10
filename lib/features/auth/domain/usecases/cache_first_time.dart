import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';

import 'package:furnika/features/auth/domain/repositories/auth_repository.dart';

class CacheFirstTime implements UseCaseWithoutParams<void> {
  final AuthRepository _repository;

  CacheFirstTime(this._repository);

  @override
  ResultFuture<void> call() async => await _repository.cacheFirstTime();
}
