import 'package:auth_firebase_service/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  Future<void> register(String email, String password) async {
    await FirebaseAuthService.register(email, password);
    notifyListeners();
  }

  Future<void> logIn(String email, String password) async {
    await FirebaseAuthService.logIn(email, password);
    notifyListeners();
  }

  Future<void> logOut() async {
    await FirebaseAuthService.logOut();
    notifyListeners();
  }
}
