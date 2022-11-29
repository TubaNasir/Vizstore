import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class LoginProvider with ChangeNotifier {
  bool _passwordVisible = false;
  bool _errorMessage = false;

  bool get passwordVisible => _passwordVisible;
  bool get errorMessage => _errorMessage;

  final UserRepository _userRepository = UserRepository();

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


}
