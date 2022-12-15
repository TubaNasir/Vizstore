import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  Future<bool> signIn(String email, String password) async {
    dynamic result = await _corerepository.signIn(email, password);

    if(result is String){
      print('id is '+result);
      await _corerepository.setUser(result);
      notifyListeners();
      return true;
    }
    else if(result is FirebaseAuthException){
      print('sparta '+result.message.toString());
      showErrorToast('Incorrect Email or Password');
      return false;
      // _errorMessage = true;
      //notifyListeners();
    }
    return false;

  }

  void showErrorToast(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.yellow,
        textColor: Colors.black
    );
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
