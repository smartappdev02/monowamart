import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  String id;
  String fullName;
  String imageUrl;
  String phoneNumber;
  String email;

  UserModel({
    this.id = '',
    this.fullName = '',
    // this.address = '',
    this.phoneNumber = '',
    this.imageUrl = '',
    this.email = '',

  });

}
