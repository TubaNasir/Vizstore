import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/user_model.dart';

class ProfileProvider with ChangeNotifier{

  ProfileProvider(this._userRepository);

  UserRepository _userRepository;

  void logout() async {
    await _userRepository.signOut();
  }
}