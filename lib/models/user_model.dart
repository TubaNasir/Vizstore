import 'package:flutterdemo/models/wishlist_model.dart';
import 'cart_model.dart';

class UserProfile {
  String? id;
  //String email;
  //String password;
  String firstName;
  String lastName;
  String contactNo;
  // Cart? cart = Cart(products: [], stock: 0);
  // Wishlist? wishlist = Wishlist(products: []);

  UserProfile({
    required this.id,
    //required this.email,
    required this.firstName,
    required this.lastName,
    //required this.password,
    required this.contactNo,
    // this.cart,
    // this.wishlist,
  });

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "LastName": lastName,
    "contactNo": contactNo,
  };
}
