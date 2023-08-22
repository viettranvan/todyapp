import 'package:todyapp/apis/auth/auth_service.dart';

class SignUpRepository {
  SignUpRepository._();

  static Future<void> createNewAccount({
    required String email,
    required String password,
    required String displayName,
  }) =>
      AuthService()
          .signUp(email: email, password: password, displayName: displayName);
}
