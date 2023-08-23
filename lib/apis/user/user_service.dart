import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todyapp/models/index.dart';
import 'package:todyapp/utils/index.dart';

class UserService {
  UserService();

  Future<UserProfile> getUserProfile() async {
    var userId = await locator<AppStorage>().getValue(AppStorageKey.uid);
    var docSnap =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    var userMap = docSnap.data() ?? {};

    return UserProfile.fromMap(userMap);
  }
}
