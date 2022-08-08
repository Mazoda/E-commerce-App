import 'package:firebase/data/auth_Helper.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {}
  Future signIn(String emailAddress, String pass)async{
await AuthHelper.authHelper.signIn(emailAddress, pass);
notifyListeners();

  }
    Future signUp(String emailAddress, String pass)async{
await AuthHelper.authHelper.signUp(emailAddress, pass);
notifyListeners();

  }

}
