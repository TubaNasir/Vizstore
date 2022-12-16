import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_model.dart';

class OrderJson {
  OrderJson({
    this.id,
    required this.userId,
    required this.cart,
    this.status = 'Placed',
    required this.date_created,
    required this.city,
    required this.address,
    required this.total
  });

  String? id;
  String? userId;
  List<CartItemJson> cart;
  String status;
  DateTime date_created;
  String city;
  String address;
  int total;

  OrderJson.empty() : userId = '', cart = [], status = '', date_created = DateTime.now(), city = '', address = '', total = 0 ;

  factory OrderJson.fromJson(Map<String, dynamic> json, String id) => OrderJson(
    userId: json["userId"] as String? ?? '',
    id: id ?? '',
    cart: List<CartItemJson>.from(json["cart"].map((x) => CartItemJson.fromJson(x))),
    status: json["status"] as String? ?? '',
    date_created: (json["date_created"] as Timestamp).toDate(),
    //date_created: Timestamp.fromDate(json["date_created"]),
    city: json["city"] as String? ?? '',
    address: json["address"]  as String? ?? '',
    total: json["total"] as int? ?? 0
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
    "status": status,
    "date_created": date_created,
    "city": city,
    "address": address,
    "total": total
  };
  
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }
}