// utils
import 'package:demonstration_project/utils/enum_util.dart';

enum UserRoles {
  admin,
  qa,
  viewer,
}

class UserModel {
  bool? active;
  String? createdAt;
  String? email;
  String? firstName;
  String? lastName;
  int? id;
  List<UserRoles?>? roles;

  UserModel({
    this.active,
    this.createdAt,
    this.email,
    this.firstName,
    this.lastName,
    this.id,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      active: json['active'],
      createdAt: json['created_at'],
      email: json['email'],
      firstName: json['first_name'] ?? 'John',
      lastName: json['last_name'] ?? 'Doe',
      id: json['id'],
      roles: stringListToEnumList(
          UserRoles.values, List<String>.from(json['roles'])),
    );
  }

  String get fullName {
    return '$firstName $lastName';
  }

  bool isEqual(UserModel? userModel) {
    return userModel != null && id == userModel.id;
  }

  @override
  String toString() => '$firstName $lastName';
}
