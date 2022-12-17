import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/user_model.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CompleteProfileProvider with ChangeNotifier {

  CompleteProfileProvider(this._coreRepository);

  UserRepository _coreRepository;

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
    showSignedUpToast('Successfully signed up! Please login to continue.');
    print('done adding');
  }

  void showSignedUpToast(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: SecondaryColor,
        textColor: Colors.black
    );
  }
}