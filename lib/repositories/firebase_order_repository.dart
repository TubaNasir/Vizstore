import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/order_json.dart';

class OrderRepository {
  final db = FirebaseFirestore.instance;

  Future<List<OrderJson>> getOrderList() async {
    List<OrderJson> orders = [];
    await db.collection("order").get().then((event) {
      orders =
          event.docs.map((e) => OrderJson.fromJson(e.data(), e.id)).toList();
    }).catchError((error) => print("Failed to fetch orders. Error : ${error}"));
    return orders;
  }

  Future<void> addOrder(OrderJson newOrder) async {
    await db
        .collection("order")
        .add(newOrder.toJson())
        .then((value) => print("Order Added"))
        .catchError((error) => print('Error:' + error));
  }
}
