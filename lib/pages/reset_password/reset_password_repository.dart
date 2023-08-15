import 'package:todyapp/apis/api_client/api_response.dart';
import 'package:todyapp/apis/auth/auth_service.dart';

class ResetPasswordRepository {
  ResetPasswordRepository();

  Future<ApiResponse> resetPassword({
    required String oobCode,
    required String newPassword,
  }) =>
      AuthService().resetPassword(oobCode: oobCode, newPassword: newPassword);
}
