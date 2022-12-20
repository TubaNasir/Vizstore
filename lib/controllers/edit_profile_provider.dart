import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileProvider with ChangeNotifier {
  EditProfileProvider(this._userRepository);

  final UserRepository _userRepository;

  UserJson _user = UserJson.empty();
  bool _enabled = false;
  bool _isFetching = true;

  UserJson get user => _user;

  bool get enabled => _enabled;

  bool get isFetching => _isFetching;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> editProfile(
      String firstName, String lastName, String contact) async {
    UserJson updatedUser = _user.copyWith(
        firstName: firstName, lastName: lastName, contact: contact);
    await _userRepository.updateUser(updatedUser);
    showEditedToast('Profile has been edited');

    await getUser();
  }

  void setEnabled(bool set) {
    _enabled = set;
    notifyListeners();
  }

  void showEditedToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: SecondaryColor,
        textColor: Colors.black);
  }

  void setIsFetchingTrue() {
    _isFetching = true;
    notifyListeners();
  }

  void setIsFetchingFalse() {
    _isFetching = false;
    notifyListeners();
  }
}
