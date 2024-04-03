import 'package:equatable/equatable.dart';

enum Gender { male, female }

class User extends Equatable {
  final String id;
  final String userName;
  final String email;
  final String? phoneNumber;
  final String? avatar;
  final String? birthday;
  final String? gender;

  const User({
    required this.id,
    required this.userName,
    required this.email,
    this.phoneNumber,
    this.avatar = '',
    this.birthday,
    this.gender,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        email,
        phoneNumber,
        avatar,
        birthday,
        gender,
      ];
}
