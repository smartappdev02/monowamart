import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:monowamart/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  bool get isLoggedIn => true;

  //_auth.currentUser != null && !_auth.currentUser!.isAnonymous;
  Future<void> signUp(
      {required String email,
      required String password,
      required UserModel userModel}) async {
    // upload user image to firebase storage and get the url
    if (userModel.imageUrl.isNotEmpty) {
      print("data");
    }
  }

  Future<void> signInAnonymously() async {}

  Future<void> signIn(
      {required String email, required String password}) async {}

  //Reset Password
  Future<void> resetPassword({required String email}) async {}

  Future<void> signOut(BuildContext context) async {}
}
