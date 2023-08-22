import 'package:todyapp/apis/api_client/api_request.dart';
import 'package:todyapp/apis/api_client/http_method.dart';

class AuthRequest {
  AuthRequest._();

  static APIRequest signInWithPassword({
    required String email,
    required String password,
  }) =>
      APIRequest(
          method: HTTPMethods.post,
          path: 'accounts:signInWithPassword',
          body: {
            "email": email,
            "password": password,
            "returnSecureToken": true
          });

  static APIRequest singUp({
    required String email,
    required String password,
  }) =>
      APIRequest(method: HTTPMethods.post, path: 'accounts:signUp', body: {
        "email": email,
        "password": password,
        "returnSecureToken": true,
      });

  static APIRequest resetPassword({
    required String oobCode,
    required String newPassword,
  }) =>
      APIRequest(method: HTTPMethods.post, path: 'resetPassword', body: {
        "oobCode": oobCode,
        "newPassword": newPassword,
      });

  static APIRequest changePassword({
    required String idToken,
    required String password,
  }) =>
      APIRequest(method: HTTPMethods.post, path: 'accounts:update', body: {
        "idToken": idToken,
        "password": password,
        "returnSecureToken": true,
      });

  static APIRequest updateAvatar({
    required String idToken,
    required String photoUrl,
  }) =>
      APIRequest(method: HTTPMethods.post, path: 'accounts:update', body: {
        "idToken": idToken,
        "photoUrl": photoUrl,
        "returnSecureToken": true,
      });

  static APIRequest sendEmailResetPassword({
    required String email,
  }) =>
      APIRequest(method: HTTPMethods.post, path: 'accounts:sendOobCode', body: {
        "requestType": "PASSWORD_RESET",
        "email": email,
      });
}
