import 'package:talowadaag/features/authentications/user/user_model.dart';
import 'package:talowadaag/features/authentications/user/user_roles.dart';

class UserService {
  static List<UserModel> users = [
    UserModel(
        userId: '10',
        name: 'Mohamed',
        email: 'oglehmo@gmail.com',
        password: '123456',
        role: UserRole.user),
    UserModel(
        userId: '11',
        name: 'Jama',
        email: 'jamao@gmail.com',
        password: '123456',
        role: UserRole.companyUser)
  ];

  static void createUser({required String email,
    required String password,
    required String name,
    required UserRole role}) {
    int id = 0;

    users.add(
      UserModel(
        userId: 'userId:${id++}',
        name: name,
        email: email,
        password: password,
        role: role,
      ),
    );
  }

  static bool loginWithUsernamePassword(
      {required String email, required String password}) {
    for (UserModel user in users) {
      print(user);

      if (email == user.email && password == user.password) {
        print('Matched $email = ${user.email} and password ${user
            .password} = $password');
        return true;
      }
    }
    return false;
  }
}
