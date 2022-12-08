import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/notification_model.dart';
import '../models/store_model.dart';
import '../models/user_model.dart';
import '../repositories/store_repository.dart';
import 'package:get_it/get_it.dart';

class NotificationsProvider with ChangeNotifier {

  NotificationsProvider( this._userRepository, this._storeRepository,
     );

  StoreRepository _storeRepository;
  UserRepository _userRepository;

  UserJson _user = UserJson.empty();
  List<NotificationItemJson> _notifications = [];

  UserJson get user => _user;
  List<NotificationItemJson> get notifications => _notifications;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
    print('prov' + _user.firstName);
    print("notsi ${_user.notifications}");
  }

  void getSortedNotifications() {
    _notifications = List.from(_user.notifications)..sort((item1, item2) => - item1.dateTime.compareTo(item2.dateTime));
    notifyListeners();
  }





}