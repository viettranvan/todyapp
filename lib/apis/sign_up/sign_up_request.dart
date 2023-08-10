import 'package:firebase_auth/firebase_auth.dart';

class SignUpRequest {
  SignUpRequest();

  Future<UserCredential> createNewAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = FirebaseAuth.instance.currentUser;
    await user?.updateDisplayName(name);
    return data;
  }
}
