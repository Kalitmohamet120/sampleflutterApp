import 'package:talowadaag/features/authentications/user/user_roles.dart';

class UserModel {
  final String userId;
  final String name;
  final String email;
  final String password;
  final UserRole role;

  UserModel(
      {required this.userId,
      required this.name,
      required this.email,
      required this.password,
      required this.role});

  @override
  String toString() {
    return 'UserModel{userId: $userId, name: $name, email: $email, password: $password, role: $role}';
  }
}
