import 'package:furnika/core/common/entities/user.dart';
import 'package:furnika/core/utils/typedefs.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  ResultFuture<User> getCurrentUser();
  ResultFuture<User> updateProfile({
    required String username,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
  });
}
