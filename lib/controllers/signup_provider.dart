
import 'package:flutter/material.dart';

import '../core/user_repository.dart';
import '../models/user_model.dart';

class SignupProvider with ChangeNotifier{
  final UserRepository _coreRepository = UserRepository();

  void addNewUser(String? uid, String firstName,String lastName,String contact,) async {
    UserJson newUser = UserJson(
      id: uid,
      //email:  widget.user.user?.email,
      firstName: firstName,
      lastName: lastName,
      //password:  widget.user.user?.,
      contact: contact,
      cart: [],
      wishlist: [],
    );
    await _coreRepository.addUser(newUser);
    print('done adding');
  }

  String? signUp(String email, String password){
    String? uid = _coreRepository.signUp(email, password) as String?;
    return uid;
  }


}