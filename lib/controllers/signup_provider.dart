
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/user_repository.dart';
import '../models/user_model.dart';

class SignupProvider with ChangeNotifier{
  final UserRepository _coreRepository = UserRepository();


  void addNewUser(User? user, String firstName,String lastName,String contact,) async {
    UserJson newUser = UserJson(
      id: user?.uid,
      email: user?.email,
      firstName: firstName,
      lastName: lastName,
      contact: contact,
      cart: [],
      wishlist: [],
      notifications: [],
      //photoUrl: user?.photoURL,
    );
    await _coreRepository.addUser(newUser);
    print('done adding');
  }

  Future<User?> signUp(String email, String password) async {

    dynamic result  = await _coreRepository.signUp(email, password);
    if(result is User){
      return result;
    }
    else if(result is FirebaseAuthException){
      showErrorToast('User Already Exists');
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


}