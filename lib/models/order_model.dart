import 'cart_model.dart';

class Order {
  Order({
    required this.userId,
    required this.orderId,
    required this.cart,
    required this.status,
    required this.date_created,
    required this.city,
    required this.address,
    required this.total,
  });

  String userId;
  String orderId;
  List<CartItemJson> cart;
  String status;
  DateTime date_created;
  String city;
  String address;
  int total;

  factory Order.fromJson(Map<String, dynamic> json, String id) => Order(
    userId: json["userId"],
    orderId: id,
    cart: List<CartItemJson>.from(json["cart"].map((x) => CartItemJson.fromJson(x))),
    status: json["status"],
    date_created: json["date_created"],
    city: json["city"],
    address: json["address"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
    "status": status,
    "date_created": date_created,
    "city": city,
    "address":address,
    "total": total
  };
}