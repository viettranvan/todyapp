import 'package:todyapp/apis/auth/auth_service.dart';
import 'package:todyapp/models/index.dart';

class LoginRepository {
  LoginRepository();

  Future<UserAuth> signIn({
    required String email,
    required String password,
  }) =>
      AuthService().signInWithPassword(email: email, password: password);
}
