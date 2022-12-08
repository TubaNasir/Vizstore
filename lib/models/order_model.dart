import 'cart_model.dart';

class OrderJson {
  OrderJson({
    this.id,
    required this.userId,
    required this.cart,
    this.status = 'Pending',
    required this.date_created,
    required this.city,
    required this.address
  });

  String? id;
  String? userId;
  List<CartItemJson> cart;
  String status;
  DateTime date_created;
  String city;
  String address;

  factory OrderJson.fromJson(Map<String, dynamic> json, String id) => OrderJson(
    userId: json["userId"],
    id: id,
    cart: List<CartItemJson>.from(json["cart"].map((x) => CartItemJson.fromJson(x))),
    status: json["status"],
    date_created: json["date_created"],
    city: json["city"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
    "status": status,
    "date_created": date_created,
    "city": city,
    "address": address
  };
}