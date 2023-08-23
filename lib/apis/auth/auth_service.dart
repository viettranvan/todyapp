import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todyapp/apis/api_client/index.dart';
import 'package:todyapp/apis/index.dart';
import 'package:todyapp/models/index.dart';
import 'package:todyapp/utils/index.dart';

class AuthService {
  AuthService();
  final APIClient _client = APIClient();

  Future<UserAuth> signInWithPassword({
    required String email,
    required String password,
  }) async {
    var request =
        AuthRequest.signInWithPassword(email: email, password: password);

    var response = await _client.execute(request: request);
    return UserAuth.fromMap(response.data);
  }

  Future<UserAuth?> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final firebaseUser =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    if (firebaseUser != null) {
      final users = FirebaseFirestore.instance.collection('users');
      var check = await users.where('id', isEqualTo: firebaseUser.uid).get();
      if (check.docs.isEmpty) {
        users.doc(firebaseUser.uid).set({
          'displayName': firebaseUser.displayName,
          'photoUrl': firebaseUser.photoURL,
          'email': firebaseUser.email,
          'id': firebaseUser.uid
        });
      }
      return UserAuth(
        email: firebaseUser.email,
        localId: firebaseUser.uid,
        idToken: await firebaseUser.getIdToken(),
        refreshToken: firebaseUser.refreshToken,
      );
    }
    return null;
  }

  Future<void> signUp({
    required String email,
    required String displayName,
    required String password,
  }) async {
    var request = AuthRequest.singUp(
      email: email,
      password: password,
    );

    var response = await _client.execute(request: request);

    UserAuth user = UserAuth.fromMap(response.data);

    FirebaseFirestore.instance.collection('users').doc(user.localId).set({
      'displayName': displayName,
      'photoUrl': null,
      'email': user.email,
      'id': user.localId
    });
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

  Future<AuthModel> changePassword({
    required String idToken,
    required String newPassword,
  }) async {
    var request =
        AuthRequest.changePassword(idToken: idToken, password: newPassword);

    var response = await _client.execute(request: request);
    return AuthModel.fromMap(response.data);
  }

  Future<ApiResponse> updateAvatar({
    required String photoUrl,
  }) async {
    var idToken = await locator<AppStorage>().getValue(AppStorageKey.idToken);
    var request =
        AuthRequest.updateAvatar(idToken: idToken ?? '', photoUrl: photoUrl);

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
