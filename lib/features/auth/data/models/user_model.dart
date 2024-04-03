import 'package:furnika/features/auth/domain/entitties/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.userName,
    required super.email,
    super.phoneNumber,
    super.avatar,
    super.birthday,
    super.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
