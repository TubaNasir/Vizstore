import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserProvider with ChangeNotifier{
  final UserRepository _userRepository = UserRepository();

  String UId = '';

  void addNewUser(UserProfile newUser) async {
    await _userRepository.addUser(newUser);
    print('done adding');
    //notifyListeners();
  }
}