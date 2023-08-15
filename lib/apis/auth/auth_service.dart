import 'package:todyapp/apis/api_client/index.dart';
import 'package:todyapp/apis/index.dart';

class AuthService {
  AuthService();
  final APIClient _client = APIClient();

  Future<ApiResponse> signInWithPassword({
    required String email,
    required String password,
  }) async {
    var request =
        AuthRequest.signInWithPassword(email: email, password: password);

    var response = await _client.execute(request: request);
    return response;
  }

  Future<ApiResponse> signUp({
    required String email,
    required String password,
  }) async {
    var request = AuthRequest.singUp(email: email, password: password);

    var response = await _client.execute(request: request);
    return response;
  }

  Future<ApiResponse> resetPassword({
    required String oobCode,
    required String newPassword,
  }) async {
    var request =
        AuthRequest.resetPassword(oobCode: oobCode, newPassword: newPassword);

    var response =
        await _client.execute(request: request, apiVersion: ApiVersion.ver3);
    return response;
  }

  Future<ApiResponse> changePassword({
    required String idToken,
    required String newPassword,
  }) async {
    var request =
        AuthRequest.changePassword(idToken: idToken, password: newPassword);

    var response = await _client.execute(request: request);
    return response;
  }

  Future<ApiResponse> sendEmailResetPassword({
    required String email,
  }) async {
    var request = AuthRequest.sendEmailResetPassword(email: email);

    var response = await _client.execute(request: request);
    return response;
  }
}
