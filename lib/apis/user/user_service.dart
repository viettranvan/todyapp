import 'package:todyapp/apis/api_client/index.dart';
import 'package:todyapp/apis/user/user_request.dart';
import 'package:todyapp/models/index.dart';

class UserService {
  UserService();
  final APIClient _client = APIClient();

  Future<UserProfile> getUserProfile({
    required String userId,
  }) async {
    var request = UserRequest.getUserProfile(userId: userId);

    var response = await _client.execute(
        request: request, apiVersion: ApiVersion.dioFireStore);

    return UserProfile.fromMap(response.data["fields"]);
  }
}
