
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

    User? user  = await _coreRepository.signUp(email, password) as User?;
    return user;
  }


}