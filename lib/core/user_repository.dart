import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutterdemo/models/store_model.dart";

import '../models/user_model.dart';

class UserRepository{
  final db = FirebaseFirestore.instance;
  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  UserJson _user = UserJson.empty();

  Future<UserJson?> getUser() async {
    await db.collection("user").doc(firebaseauth.currentUser?.uid).get().then((event) {
      _user = UserJson.fromJson(event.data() as Map<String, dynamic>);
    }).catchError((error) => print("Failed to fetch user. Error : ${error}"));

}

  void signIn(String email, String password) async {

    try {
      UserCredential userCred = await firebaseauth
          .signInWithEmailAndPassword(email: email,
          password: password);
      //String? user = firebaseauth.currentUser?.uid;
      print(
          userCred.user?.uid);
    }
    catch (e) {
      print(e); //add incorrect email or pass label if error
    }
  }

  Future<String?> signUp(String email, String password) async {
    try {
      UserCredential userCred = await firebaseauth
          .createUserWithEmailAndPassword(
          email: email,
          password: password);
      //String? user = firebaseauth.currentUser?.uid;
      print(
          userCred.user?.uid);

      return userCred.user?.uid;
    }
    catch (e) {
      print(e); //add incorrect email or pass label if error
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