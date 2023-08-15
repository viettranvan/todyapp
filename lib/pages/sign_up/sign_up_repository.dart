import 'package:todyapp/apis/api_client/api_response.dart';
import 'package:todyapp/apis/auth/auth_service.dart';

class SignUpRepository {
  SignUpRepository._();

  static Future<ApiResponse> createNewAccount({
    required String email,
    required String password,
  }) =>
      AuthService().signUp(email: email, password: password);
}
