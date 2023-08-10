import 'package:todyapp/apis/index.dart';

class ForgotPasswordRepository {
  ForgotPasswordRepository();

  Future<void> sendEmailForgotPassword({required String email}) =>
      AuthRequest().sendPasswordResetEmail(email: email);
}
