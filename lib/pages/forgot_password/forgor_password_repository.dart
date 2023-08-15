import 'package:todyapp/apis/api_client/api_response.dart';
import 'package:todyapp/apis/auth/auth_service.dart';

class ForgotPasswordRepository {
  ForgotPasswordRepository();

  Future<ApiResponse> sendEmailForgotPassword({required String email}) =>
      AuthService().sendEmailResetPassword(email: email);
}
