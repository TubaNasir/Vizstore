import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterdemo/models/cart_model.dart';
import "package:flutterdemo/models/store_model.dart";
import 'package:flutterdemo/models/wishlist_model.dart';

import '../models/user_model.dart';

class UserRepository {
  final db = FirebaseFirestore.instance;
  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  UserJson _user = UserJson.empty();

  Future<void> setUser(String? id) async {
    UserJson newUser = UserJson.empty();
    await db.collection("user").doc(id).get().then((event) {
      newUser = UserJson.fromJson(event.data() as Map<String, dynamic>);
    }).catchError((error) => print("Failed to fetch user. Error : ${error}"));

    _user = newUser;
    print("alal" + _user.firstName);
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

     await db.collection("user").doc(id).get().then((event) {
       _user = UserJson.fromJson(event.data() as Map<String, dynamic>) as UserJson;
     }).catchError((error) => print("Failed to fetch user. Error : ${error}"));

   // print(_user.firstName);
   // return UserJson(email: 'tuba@gmail.com', firstName: 'Tuba', lastName: 'Nasir', contact: '0232671361', cart: [CartItemJson(productId: "c1lxWoPXbvhfsUBOcOau", quantity: 76), CartItemJson(productId: "hQLbmZ4oIDUgx1xEWXEu", quantity: 7)], wishlist: [WishlistItemJson(productId: "hQLbmZ4oIDUgx1xEWXEu")]);

    return _user;
  }

  Future<String?> signIn(String email, String password) async {
    try {
      UserCredential userCred = await firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCred.user?.uid;
      //getuser from uid
    } catch (e) {
      print(e); //add incorrect email or pass label if error
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCred = await firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password);
      //String? user = firebaseauth.currentUser?.uid;
      print(userCred.user?.uid);

      return userCred.user;
    } catch (e) {
      print(e);
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
}
