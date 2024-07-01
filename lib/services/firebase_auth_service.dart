import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static Future<void> register(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error in register: $e");
    }
  }

  static Future<void> logIn(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error on logIn: $e");
    }
  }

  static Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error on logOut: $e");
    }
  }

  static Future<void> resetPassword() async {
    //  nothing yet
  }
}
