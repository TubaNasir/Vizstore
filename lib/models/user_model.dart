import 'package:flutterdemo/models/wishlist_model.dart';
import 'cart_model.dart';

class UserJson {
  String? id;
  String firstName;
  String lastName;
  String contactNo;
  List<CartItemJson> cart;
  List<WishlistItemJson> wishlist;

  UserJson({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.contactNo,
    required this.cart,
    required this.wishlist,
  });

  static UserJson fromJson(Map<String, dynamic> json, String id) {
    return UserJson(id: id,
      firstName: json["firstName"],
      lastName: json["lastName"],
      contactNo: json["contactNo"],
      cart: json["cart"],
      wishlist: json["wishlist"],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "firstName": firstName,
        "LastName": lastName,
        "contactNo": contactNo,
        "cart": List<dynamic>.from(cart.map((e) => e.toJson())),
        "wishlist": List<dynamic>.from(wishlist.map((e) => e.toJson())),
      };


}
