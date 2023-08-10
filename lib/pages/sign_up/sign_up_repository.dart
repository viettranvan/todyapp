import 'package:firebase_auth/firebase_auth.dart';
import 'package:todyapp/apis/index.dart';

class SignUpRepository {
  SignUpRepository._();

  static Future<UserCredential> createNewAccount({
    required String name,
    required String email,
    required String password,
  }) =>
      AuthRequest()
          .createNewAccount(name: name, email: email, password: password);
}
