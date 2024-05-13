import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/user.dart';
import 'package:furnika/core/usecases/usecase.dart';
import 'package:furnika/core/utils/typedefs.dart';
import 'package:furnika/features/profile/domain/repositories/profile_repository.dart';

class UpdateCurrentUser
    implements UseCaseWithParams<User, UpdateCurrentUserParams> {
  const UpdateCurrentUser(this.repository);

  final ProfileRepository repository;

  @override
  ResultFuture<User> call(UpdateCurrentUserParams params) {
    return repository.updateProfile(
      username: params.username,
      email: params.email,
      phoneNumber: params.phoneNumber,
      gender: params.gender,
      birthday: params.birthday,
    );
  }
}

class UpdateCurrentUserParams extends Equatable {
  const UpdateCurrentUserParams({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.birthday,
  });

  final String username;
  final String email;
  final String phoneNumber;
  final String gender;
  final String birthday;

  @override
  List<Object?> get props => [username, email, phoneNumber];
}
