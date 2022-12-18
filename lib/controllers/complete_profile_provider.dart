import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CompleteProfileProvider with ChangeNotifier {
  CompleteProfileProvider(this._userRepository);

  UserRepository _userRepository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void addNewUser(
    User? user,
    String firstName,
    String lastName,
    String contact,
  ) async {
    _isLoading = true;
    notifyListeners();

    UserJson newUser = UserJson(
      id: user?.uid,
      email: user?.email,
      firstName: firstName,
      lastName: lastName,
      contact: contact,
      cart: [],
      wishlist: [],
      notifications: [],
    );

    await _userRepository.addUser(newUser);
    _isLoading = false;
    notifyListeners();
    showSignedUpToast('Successfully signed up! Please login to continue');
  }

  void showSignedUpToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: SecondaryColor,
        textColor: Colors.black);
  }
}
