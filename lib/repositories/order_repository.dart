import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/order_model.dart';

class OrderRepository {
  final db = FirebaseFirestore.instance;

  Future<List<OrderJson>> getOrderList() async {
    List<OrderJson> orders = [];
    await db.collection("order").get().then((event) {
      orders = event.docs.map((e) => OrderJson.fromJson(e.data(), e.id)).toList();
    }).catchError((error) => print("Failed to fetch products. Error : ${error}"));

    return orders;
  }

  addOrder(OrderJson newOrder) async {
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