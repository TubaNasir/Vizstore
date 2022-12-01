import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutterdemo/models/store_model.dart";

import '../models/user_model.dart';

class UserRepository{
  final db = FirebaseFirestore.instance;
  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  final UserJson _user = UserJson.empty();

  Future<void> setUser(String? id) async {
    UserJson user = UserJson.empty();
    await db.collection("user").doc(id).get().then((event) {
      user = UserJson.fromJson(event.data() as Map<String, dynamic>);
    }).catchError((error) => print("Failed to fetch user. Error : ${error}"));

    _user.copyWith(user.id, user.firstName, user.lastName, user.contact, user.cart, user.wishlist, user.email);

    print("alal" + _user.firstName);

}

  UserJson getUser() {
    print('repo '+_user.firstName);
    return _user;
  }



  Future<String?> signIn(String email, String password) async {
    try {
      UserCredential userCred = await firebaseauth
          .signInWithEmailAndPassword(email: email,
          password: password);

      //print(userCred.user?.uid);

     //await setUser(userCred.user?.uid);
      return userCred.user?.uid;
      //getuser from uid
    }
    catch (e) {
      print(e); //add incorrect email or pass label if error
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCred = await firebaseauth
          .createUserWithEmailAndPassword(
          email: email,
          password: password);
      //String? user = firebaseauth.currentUser?.uid;
      print(
          userCred.user?.uid);

      return userCred.user;
    }
    catch (e) {
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