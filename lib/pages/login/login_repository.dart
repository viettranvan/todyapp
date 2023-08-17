import 'package:todyapp/apis/auth/auth_service.dart';
import 'package:todyapp/models/user_login/index.dart';

class LoginRepository {
  LoginRepository();

  Future<UserLogin> signIn({
    required String email,
    required String password,
  }) =>
      AuthService().signInWithPassword(email: email, password: password);
}
