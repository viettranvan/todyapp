import 'package:firebase_auth/firebase_auth.dart';

class AuthRequest {
  AuthRequest();

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

  Future<void> sendPasswordResetEmail({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
