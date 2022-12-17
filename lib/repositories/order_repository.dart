import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/order_json.dart';

class OrderRepository {
  final db = FirebaseFirestore.instance;

  Future<List<OrderJson>> getOrderList() async {
    List<OrderJson> orders = [];
    await db.collection("order").get().then((event) {
      orders = event.docs.map((e) => OrderJson.fromJson(e.data(), e.id)).toList();
    }).catchError((error) => print("Failed to fetch orders. Error : ${error}"));

    return orders;
  }

  // Future<List<OrderJson>> getUserOrderList(String id) async {
  //   OrderJson orders = OrderJson.empty();
  //   await db.collection("order").doc(id).get().then((event) {
  //     orders = OrderJson.fromJson(event.data() as Map<String, dynamic>, event.id);
  //   }).catchError((error) => print("Failed to fetch orders. Error : ${error}"));
  //
  //   return orders;
  // }

  Future<void> addOrder(OrderJson newOrder) async {
    print('before addorder');
    bool error = false;
    await db
        .collection("order")
        .add(newOrder.toJson())
        .then((value) => print("Order Added"))
        .catchError((error) => print('error is '+error) );

    print('after addorder');
   // return error;
  }


}