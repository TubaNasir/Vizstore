
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../repositories/user_repository.dart';
import '../models/user_json.dart';

class SignupProvider with ChangeNotifier{

  SignupProvider(this._coreRepository);

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _userGoogle;

  UserRepository _coreRepository;

  bool _passwordVisible = false;
  bool _rePasswordVisible = false;

  bool get passwordVisible => _passwordVisible;
  bool get rePasswordVisible => _rePasswordVisible;
  GoogleSignInAccount get userGoogle => _userGoogle!;

  void changePasswordVisible() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  void changeRePasswordVisible() {
    _rePasswordVisible = !_rePasswordVisible;
    notifyListeners();
  }

  Future<User?> signUp(String email, String password) async {

    dynamic result  = await _coreRepository.signUp(email, password);
    if(result is User){
      return result;
    }
    else if(result is FirebaseAuthException){
      showErrorToast('This email address is already in use');
    }
    return null;

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
    print("googleUser ${googleUser}");
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

}