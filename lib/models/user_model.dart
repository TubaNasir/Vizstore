import 'package:flutterdemo/models/wishlist_model.dart';
import 'cart_model.dart';

class UserJson {
  String? id;
  final String? email;
  final String firstName;
  final String lastName;
  final String contact;
  String photoUrl;
  final List<CartItemJson> cart;
  final List<WishlistItemJson> wishlist;

  UserJson({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.contact,
    this.photoUrl = 'https://img.icons8.com/bubbles/50/000000/user.png',
    required this.cart,
    required this.wishlist,
  });

  UserJson.empty()
      : email = '',
        firstName = 'h',
        lastName = '',
        contact = '',
        photoUrl = '',
        cart = [],
        wishlist = [];

  UserJson copyWith(
    String? id,
    String? firstName,
    String? lastName,
    String? contact,
    List<CartItemJson>? cart,
    List<WishlistItemJson>? wishList,
  ) =>
      UserJson(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        contact: contact ?? this.contact,
        cart: cart ?? this.cart,
        wishlist: wishList ?? this.wishlist,
        email: email ?? this.email,
      );

  static UserJson fromJson(Map<String, dynamic> json) {
    return UserJson(
      //id: json["id"] as String? ?? '',
      email: json["email"] as String? ?? '',
      firstName: json["firstName"] as String? ?? '',
      lastName: json["lastName"] as String? ?? '',
      contact: json["contact"] as String? ?? '',
      photoUrl: json["photoUrl"] as String? ?? '',
      cart: List<CartItemJson>.from(
          json["cart"].map((x) => CartItemJson.fromJson(x))),
      wishlist: List<WishlistItemJson>.from(
          json["wishlist"].map((x) => WishlistItemJson.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        //"id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "contact": contact,
        "photoUrl": photoUrl,
        "cart": List<dynamic>.from(cart.map((e) => e.toJson())),
        "wishlist": List<dynamic>.from(wishlist.map((e) => e.toJson())),
      };
}
