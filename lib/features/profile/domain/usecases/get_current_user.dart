import 'package:furnika/core/common/entities/user.dart';
import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/profile/domain/repositories/profile_repository.dart';

class GetCurrentUser implements UseCaseWithoutParams<User> {
  const GetCurrentUser(this.repository);

  final ProfileRepository repository;

  @override
  ResultFuture<User> call() {
    return repository.getCurrentUser();
  }
}
