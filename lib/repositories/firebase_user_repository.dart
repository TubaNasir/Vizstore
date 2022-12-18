import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/notification_json.dart';
import '../models/user_json.dart';

class FirebaseUserRepository implements UserRepository{
  final db = FirebaseFirestore.instance;
  FirebaseAuth firebaseauth = FirebaseAuth.instance;
  UserJson _user = UserJson.empty();

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>> streamSubscription;

  Future<void> updateUser(UserJson user) async {

    await db
        .collection("user")
        .doc(user.id)
        .update(user.toJson())
        .then((event) {
      print("user updated");
    }).catchError((error) => print("Failed to fetch user. Error : ${error}"));
  }

  Future<void> setUser(String? id) async {
    UserJson newUser = UserJson.empty();
    await db.collection("user").doc(id).get().then((event) {
      newUser =
          UserJson.fromJson(event.data() as Map<String, dynamic>, event.id);
    }).catchError((error) => print("Failed to fetch user. Error : ${error}"));
    _user = newUser;
  }

  Future<UserJson> sendNotifications() async {
    streamSubscription = db
        .collection("order")
        .where("userId", isEqualTo: _user.id)
        .snapshots()
        .listen((event) async {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.modified:
            {
              print(_user.notifications.length);
              print("Modified City: ${change.doc.data()}");
              List<NotificationItemJson> newList = [];
              for (var notification in _user.notifications) {
                newList.add(notification);
              }
              ;
              //print(change.doc.data()!['status']);
              if (change.doc.data()!['status'] == 'Confirmed') {
                newList.add(NotificationItemJson(
                    orderId: change.doc.id,
                    message: 'You order# ${change.doc.id} has been confirmed!',
                    dateTime: DateTime.now()));
              }
              if (change.doc.data()!['status'] == 'Cancelled') {
                newList.add(NotificationItemJson(
                    orderId: change.doc.id,
                    message: 'You order# ${change.doc.id} has been cancelled.',
                    dateTime: DateTime.now()));
              }
              UserJson updatedUser = _user.copyWith(notifications: newList);
              await updateUser(updatedUser);
              _user = await getUser();
            }
        }
      }
    });
    return _user;
  }

  @override
  Future<void> cancelSubscription() async {
      await streamSubscription.cancel(); //Cancel your subscription here.
  }

  @override
  Future<UserJson> getUser() async {
    String? id = await firebaseauth.currentUser?.uid;
    await db.collection("user").doc(id).get().then((event) {
      _user = UserJson.fromJson(event.data() as Map<String, dynamic>, event.id);
    }).catchError(
        (error) => print("Failed to fetch user. Error : ${error}")); //

    return _user;
  }

  Future signIn(String email, String password) async {
    User? user;
    try {
      UserCredential userCred = await firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);

      user = userCred.user;
      return user?.uid;
    } catch (e) {
      return e;
    }
  }

  Future signUp(String email, String password) async {
    try {
      UserCredential userCred = await firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCred.user?.uid);
      return userCred.user;
    } catch (e) {
      return e;
    }
  }

   addUser(UserJson newUser) async {
    await db
        .collection("user")
        .doc(newUser.id)
        .set(newUser.toJson())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<bool> doesUserExist(String id) async {
    bool exist = false;
    await db
        .collection("user")
        .where("id", isEqualTo: id)
        .get()
        .then((value) => value.size > 0 ? exist = true : exist = false);
    return exist;
  }

  Future<void> signOut() async {
    await firebaseauth.signOut();
  }
}
