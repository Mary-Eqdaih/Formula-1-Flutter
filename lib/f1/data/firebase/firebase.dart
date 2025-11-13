import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  // Sign in
  static Future<UserCredential?> signIn(String email, String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }

  // Sign  up

  static Future<UserCredential> signUp(
    String email,
    String password,
    String username,
  ) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    await credential.user!.updateDisplayName(username);
    await credential.user!.reload();
    return credential;
  }

  // log out

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
