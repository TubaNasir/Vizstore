import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/cart_model.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/screens/cart/cart.dart';

import '../models/user_model.dart';

class UserRepository {
  final db = FirebaseFirestore.instance;



   /* final cart = {"product": "", "stock": 0};
    await db
        .collection("user")
        .doc(newUser.id)
        .collection("cart")
        .add(cart)
        .then((value) => print("Cart Added"))
        .catchError((error) => print("Failed to add cart: $error"));

    final wishlist = {"product": "", "stock": 0};
    await db
        .collection("user")
        .doc(newUser.id)
        .collection("wishlist")
        .add(wishlist)
        .then((value) => print("Wishlist Added"))
        .catchError((error) => print("Failed to add wishlist: $error"));
*/

}
