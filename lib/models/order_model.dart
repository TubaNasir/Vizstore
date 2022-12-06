import 'cart_model.dart';

class Order {
  Order({
    required this.userId,
    required this.orderId,
    required this.cart,
    required this.status,
    required this.date_created,
    required this.city,
    required this.address
  });

  String userId;
  String orderId;
  List<CartItemJson> cart;
  String status;
  DateTime date_created;
  String city;
  String address;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    userId: json["userId"],
    orderId: json["orderId"],
    cart: List<CartItemJson>.from(json["cart"].map((x) => CartItemJson.fromJson(x))),
    status: json["status"],
    date_created: json["date_created"],
    city: json["city"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "orderId": orderId,
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
    "status": status,
    "date_created": date_created,
    "city": city,
    "address":address
  };
}