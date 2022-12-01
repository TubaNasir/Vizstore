import 'package:flutterdemo/models/wishlist_model.dart';
import 'cart_model.dart';

class UserJson {
  final String? id;
  final String firstName;
  final String lastName;
  final String contact;
  final List<CartItemJson> cart;
  final List<WishlistItemJson> wishlist;

  const UserJson({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.contact,
    required this.cart,
    required this.wishlist,
  });

   UserJson.empty() : id = '', firstName = '', lastName = '', contact = '', cart = [], wishlist = [];

  static UserJson fromJson(Map<String, dynamic> json) {
    return UserJson(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      contact: json["contact"],
      cart: List<CartItemJson>.from(json["cart"].map((x) => CartItemJson.fromJson(x))),
      wishlist: List<WishlistItemJson>.from(json["wishlist"].map((x) => WishlistItemJson.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "contact": contact,
        "cart": List<dynamic>.from(cart.map((e) => e.toJson())),
        "wishlist": List<dynamic>.from(wishlist.map((e) => e.toJson())),
      };


}
