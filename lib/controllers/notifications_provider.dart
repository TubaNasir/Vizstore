import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/notification_json.dart';
import '../models/user_json.dart';

class NotificationsProvider with ChangeNotifier {
  NotificationsProvider(this._userRepository);

  final UserRepository _userRepository;

  UserJson _user = UserJson.empty();
  List<NotificationItemJson> _notifications = [];

  UserJson get user => _user;
  List<NotificationItemJson> get notifications => _notifications;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  void getSortedNotifications() {
    _notifications = List.from(_user.notifications)
      ..sort((item1, item2) => -item1.dateTime.compareTo(item2.dateTime));
    notifyListeners();
  }
}
