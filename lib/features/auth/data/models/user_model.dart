import 'package:furnika/core/common/entities/user.dart';

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
      id: json['_id'],
      userName: json['username'],
      phoneNumber: json['phone_number'] ?? '',
      email: json['email'],
      gender: json['gender'],
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

  UserModel copyWith({
    String? id,
    String? userName,
    String? email,
    String? phoneNumber,
    String? avatar,
    String? birthday,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatar: avatar ?? this.avatar,
      birthday: birthday ?? this.birthday,
    );
  }
}
