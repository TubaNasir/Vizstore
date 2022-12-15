import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/user_model.dart';

class EditProfileProvider with ChangeNotifier {

  EditProfileProvider(this._userRepository);

  UserRepository _userRepository;

  UserJson _user = UserJson.empty();
  bool _enabled = false;

  UserJson get user => _user;
  bool get enabled => _enabled;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> editProfile(String? firstName, String? lastName, String? contact) async {

    UserJson updatedUser = _user.copyWith(firstName: firstName, lastName: lastName, contact: contact);
    await _userRepository.updateUser(updatedUser);

    await getUser();
  }

  void setEnabled(bool set){
    _enabled = set;
    notifyListeners();
  }
}