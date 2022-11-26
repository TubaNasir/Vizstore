import 'package:flutterdemo/models/wishlist_model.dart';
import 'cart_model.dart';

class User {
  String email;
  String password;
  String firstName;
  String lastName;
  String contactNo;
  Cart cart;
  Wishlist wishlist;

  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.contactNo,
    required this.cart,
    required this.wishlist,
  });
}
