import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/user_repository.dart';
import '../models/user_model.dart';

class LoginProvider with ChangeNotifier {
  bool _passwordVisible = false;
  bool _errorMessage = false;

  bool get passwordVisible => _passwordVisible;
  bool get errorMessage => _errorMessage;

  //final UserRepository _userRepository = UserRepository();
  final UserRepository _corerepository = UserRepository();

  String UId = '';

  void changePasswordVisible() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  void changeErrorMessage() {
    _errorMessage = !_errorMessage;
    notifyListeners();
  }
  void setErrorMessage(){
    _errorMessage = false;
  }

  void signIn(String email, String password){
    _corerepository.signIn(email, password);

  }



}
