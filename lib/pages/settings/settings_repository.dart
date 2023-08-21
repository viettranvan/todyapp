import 'package:todyapp/apis/api_client/index.dart';
import 'package:todyapp/apis/auth/auth_service.dart';
import 'package:todyapp/models/index.dart';

class SettingsRepository {
  SettingsRepository();

  Future<UserLogin> signIn({
    required String email,
    required String password,
  }) =>
      AuthService().signInWithPassword(email: email, password: password);

  Future<AuthModel> changePassword({
    required String idToken,
    required String newPassword,
  }) =>
      AuthService().changePassword(idToken: idToken, newPassword: newPassword);

  Future<ApiResponse> updateAvatar({
    required String photoUrl,
  }) =>
      AuthService().updateAvatar(photoUrl: photoUrl);

  Future<UserLogin> getUserProfile() => AuthService().getUserProfile();
}
