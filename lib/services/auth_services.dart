import 'package:firbase_1/core/auth_exaption.dart/auth_exaption.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;
  static Stream<User?> authstatus() => auth.authStateChanges();
  static Future<UserCredential> singup(
      {required String emailAddress, required String password}) {
    try {
      return auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthExaption(error: e.message);
    }
  }

  static Future<void> logout() {
    return auth.signOut();
  }

    static Future<UserCredential> login(
      {required String emailAddress, required String password}) {
    try {
      return auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthExaption(error: e.message);
    }
  }


}
