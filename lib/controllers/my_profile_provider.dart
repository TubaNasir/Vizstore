import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/user_json.dart';

class MyProfileProvider with ChangeNotifier {

  MyProfileProvider(this._userRepository);

  final UserRepository _userRepository;

  void logout() async {
    await _userRepository.signOut();
  }

  Future<void> cancelSubscription()async{
    await _userRepository.cancelSubscription();
  }
}