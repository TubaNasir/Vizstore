import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterdemo/models/cart_model.dart';
import 'package:flutterdemo/models/notification_model.dart';
import "package:flutterdemo/models/store_model.dart";
import 'package:flutterdemo/models/wishlist_model.dart';

import '../models/user_model.dart';

class UserRepository {
  final db = FirebaseFirestore.instance;
  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  UserJson _user = UserJson.empty();

  Future<void> updateUser(UserJson user) async {
    //print('quantity ${user.cart[0].quantity}');
    //print('id ${user.id}');

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
    print("alal" + _user.firstName);
  }

  Future<UserJson> sendNotifications() async {
    db
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
              if (change.doc.data()!['status'] == 'confirmed') {
                newList.add(NotificationItemJson(
                    orderId: change.doc.id,
                    message: 'You order# ${change.doc.id} has been confirmed!',
                    dateTime: DateTime.now()));
              }
              if (change.doc.data()!['status'] == 'cancelled') {
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

  /* _user.copyWith(
        id: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        contact: user.contact,
        cart:user.cart,
        wishlist:user.wishlist,
        email:user.email);*/

  Future<UserJson> getUser() async {
    String? id = await firebaseauth.currentUser?.uid;
//print("getuser ${_user.cart[0].quantity}");
    await db.collection("user").doc(id).get().then((event) {
      _user = UserJson.fromJson(event.data() as Map<String, dynamic>, event.id);
    }).catchError(
        (error) => print("Failed to fetch user. Error : ${error}")); //
//     print("getuser ${_user.cart[0].quantity}");

    // print(_user.firstName);
    // return UserJson(email: 'tuba@gmail.com', firstName: 'Tuba', lastName: 'Nasir', contact: '0232671361', cart: [CartItemJson(productId: "c1lxWoPXbvhfsUBOcOau", quantity: 76), CartItemJson(productId: "hQLbmZ4oIDUgx1xEWXEu", quantity: 7)], wishlist: [WishlistItemJson(productId: "hQLbmZ4oIDUgx1xEWXEu")]);

    return _user;
  }

  Future signIn(String email, String password) async {
    String errorMessage = '';
    User? user;

    try {
      UserCredential userCred = await firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);

      user = userCred.user;
      return user?.uid;
      //getuser from uid
    } catch (e) {
      print('error '+e.toString());
      return e;
      /*switch (e) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Your password is incorrect.";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User with this email doesn't exist.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }*/
    }

  }

  Future signUp(String email, String password) async {
    try {
      UserCredential userCred = await firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password);
      //String? user = firebaseauth.currentUser?.uid;
      print(userCred.user?.uid);

      return userCred.user;
    } catch (e) {
      print(e);
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
