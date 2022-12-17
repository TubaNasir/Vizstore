import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/repositories/user_repository.dart';
import 'package:flutterdemo/models/user_json.dart';

class ProfileProvider with ChangeNotifier{

  ProfileProvider(this._userRepository);

  UserRepository _userRepository;

  void logout() async {
    await _userRepository.signOut();
  }
}