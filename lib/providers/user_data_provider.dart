import 'package:flutter/cupertino.dart';
import 'package:monowamart/models/user_model.dart';

class UserDataProvider with ChangeNotifier {
  UserModel _userData = UserModel();

  UserModel get userData => _userData;

  set userData(UserModel value) {
    _userData = value;
    notifyListeners();
  }

  Future<UserModel> fetchUserData() async {
    return UserModel();
  }

  Future<void> uploadUserData(UserModel userModel) async {}
}
