import 'package:flutterdemo/models/notification_model.dart';
import 'package:flutterdemo/models/wishlist_model.dart';
import 'cart_model.dart';

class UserJson {
  String? id;
  String? email;
  String firstName;
  String lastName;
  String contact;
  String photoUrl;
  List<CartItemJson> cart;
  List<WishlistItemJson> wishlist;
  List<NotificationItemJson> notifications;

  UserJson({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.contact,
    this.photoUrl = 'https://img.icons8.com/bubbles/50/000000/user.png',
    required this.cart,
    required this.wishlist,
    required this.notifications,
  });

  UserJson.empty()
      : email = '',
        firstName = '',
        lastName = '',
        contact = '',
        photoUrl = '',
        cart = [],
        wishlist = [],
        notifications = [];

  UserJson copyWith(
  {String? id,
    String? firstName,
    String? lastName,
    String? contact,
    List<CartItemJson>? cart,
    List<WishlistItemJson>? wishlist,
    String? email,
    List<NotificationItemJson>? notifications,}
  ) =>
      UserJson(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        contact: contact ?? this.contact,
        cart: cart ?? this.cart,
        wishlist: wishlist ?? this.wishlist,
        email: email ?? this.email,
        notifications: notifications ?? this.notifications,
      );

  static UserJson fromJson(Map<String, dynamic> json, String id) {
    return UserJson(
      id: id as String? ?? '',
      email: json["email"] as String? ?? '',
      firstName: json["firstName"] as String? ?? '',
      lastName: json["lastName"] as String? ?? '',
      contact: json["contact"] as String? ?? '',
      photoUrl: json["photoUrl"] as String? ?? '',
      cart: List<CartItemJson>.from(
          json["cart"].map((x) => CartItemJson.fromJson(x))),
      wishlist: List<WishlistItemJson>.from(
          json["wishlist"].map((x) => WishlistItemJson.fromJson(x))),
      notifications: List<NotificationItemJson>.from(
          json["notifications"].map((x) => NotificationItemJson.fromJson(x))),
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
        "notifications": List<dynamic>.from(notifications.map((e) => e.toJson())),
  };
}
