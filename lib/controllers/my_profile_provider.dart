import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';

class MyProfileProvider with ChangeNotifier {

  MyProfileProvider(this._userRepository);

  UserRepository _userRepository;

  void logout() async {
    await _userRepository.signOut();
  }
}