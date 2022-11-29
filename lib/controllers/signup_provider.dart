
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class SignupProvider with ChangeNotifier{
  final UserRepository _userRepository = UserRepository();

  void addNewUser(UserJson newUser) async {
    await _userRepository.addUser(newUser);
    print('done adding');
  }


}