import 'package:furnika/features/auth/domain/entitties/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.userName,
    required super.phoneNumber,
    required super.email,
  });
}
