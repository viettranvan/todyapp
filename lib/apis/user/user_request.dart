import 'package:todyapp/apis/api_client/index.dart';

class UserRequest {
  UserRequest._();

  static APIRequest getUserProfile({required String userId}) => APIRequest(
        method: HTTPMethods.get,
        path: 'users/$userId',
      );
}
