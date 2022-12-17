import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';

class ProfileProvider with ChangeNotifier {

  ProfileProvider(this._userRepository);

  UserRepository _userRepository;

  void logout() async {
    await _userRepository.signOut();
  }
}