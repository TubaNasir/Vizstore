import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../repositories/firebase_user_repository.dart';
import '../models/user_json.dart';

class LoginProvider with ChangeNotifier {

  LoginProvider(this._userRepository);

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _userGoogle;

  bool _isLoading = false;
  bool _passwordVisible = false;
  UserJson _user = UserJson.empty();
  final UserRepository _userRepository;

  bool get passwordVisible => _passwordVisible;
  UserJson get user => _user;
  GoogleSignInAccount get userGoogle => _userGoogle!;
  bool get isLoading => _isLoading;

  void changePasswordVisible() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  Future<bool> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    dynamic result = await _userRepository.signIn(email, password);

    if(result is String){
      _isLoading = false;
      notifyListeners();
      return true;
    }
    else if(result is FirebaseAuthException){
      _isLoading = false;
      notifyListeners();
      showErrorToast('Incorrect Email or Password');
      return false;
    }
    _isLoading = false;
    notifyListeners();
    return false;
  }

  void showErrorToast(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: SecondaryColor,
        textColor: Colors.black
    );
  }

  Future<UserCredential?> googleLogin() async {
    final googleUser = await _googleSignIn.signIn();
    if(googleUser == null) return null;
    _userGoogle = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
    );

    UserCredential userCred = await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();

    return userCred;

  }

  Future<void> sendNotifications() async {
    _user = await _userRepository.sendNotifications();
    notifyListeners();
  }


}
