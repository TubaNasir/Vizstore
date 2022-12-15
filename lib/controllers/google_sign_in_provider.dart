import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class GoogleSignInProvider with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  UserRepository _userRepository = UserRepository();


  GoogleSignInAccount get user => _user!;

  Future<User?> googleLogin() async {
    final googleUser = await _googleSignIn.signIn();
    if(googleUser == null) return null;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    
    UserCredential userCred = await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();

    return userCred.user;

  }

  Future<bool> doesUserExist() async {
    bool exist = await _userRepository.doesUserExist(user.id);
    return exist;
  }

}