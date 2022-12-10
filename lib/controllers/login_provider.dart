import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/user_repository.dart';
import '../models/user_model.dart';

class LoginProvider with ChangeNotifier {
  bool _passwordVisible = false;
  bool _errorMessage = false;
  bool _isLoggedIn = false;
  UserJson _user = UserJson.empty();

  bool get passwordVisible => _passwordVisible;

  bool get errorMessage => _errorMessage;

  bool get isLoggedIn => _isLoggedIn;

  UserJson get user => _user;

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

  void setErrorMessage() {
    _errorMessage = true;
    print('err true');
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    String? id = await _corerepository.signIn(email, password);

    // if (id == 'Your email address appears to be malformed.' ||
    //     id == 'Your password is incorrect.' ||
    //     id == "User with this email doesn't exist." ||
    //     id == "An undefined Error happened.") {
    //   _errorMessage = id;
    //
    // }

    await _corerepository.setUser(id);
    //_isLoggedIn = true;
    //getUser();
    notifyListeners();
  }

/* void getLoggedIn(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is currently signed in!');
        getUser();
      }
    });
  }*/

/*void getUser() async {
    _user = await _corerepository.getUser();
    notifyListeners();
    print('prov' + _user.firstName);
  }*/

}
