import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/notification_json.dart';
import 'package:flutterdemo/models/order_json.dart';
import 'package:flutterdemo/repositories/firebase_order_repository.dart';
import '../models/user_json.dart';

class NotificationsProvider with ChangeNotifier {
  NotificationsProvider(this._userRepository, this._orderRepository);

  final UserRepository _userRepository;
  final FirebaseOrderRepository _orderRepository;

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

  Future<OrderJson> getOrderInfo(String id) async{
    OrderJson order = await _orderRepository.getOrderInfo(id);
    return order;
  }

  Future<void> markAsOpened(String id) async {
    _user = await _userRepository.getUser();
    notifyListeners();
    List<NotificationItemJson> newList = [];
    for (var item in _user.notifications) {
      if(item.notificationId == id){
        NotificationItemJson i = item.copyWith(
            opened: true);
        newList.add(i);
      }
      else{
        newList.add(item);
      }
    }
    print(newList.length);
    UserJson updatedUser = _user.copyWith(notifications: newList);
    await _userRepository.updateUser(updatedUser);
    notifyListeners();
    _user = await _userRepository.getUser();
    notifyListeners();
    getSortedNotifications();
  }

}
