import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutterdemo/models/store_json.dart";

class StoreRepository{
  final db = FirebaseFirestore.instance;

  Future<List<StoreJson>> getStoresList() async {
    List<StoreJson> stores = [];
    await db.collection("store").get().then((event) {
      stores = event.docs.map((e) => StoreJson.fromJson(e.data(), e.id)).toList();
    }).catchError((error) => print("Failed to fetch products. Error : ${error}"));
    return stores;
  }

  Future<StoreJson> getStoreInfo(String id) async {
    StoreJson store = const StoreJson.empty();
    await db.collection("store").doc(id).get().then((event) {
      store = StoreJson.fromJson(event.data() as Map<String, dynamic>, event.id);
    }).catchError((error) => print("Failed to fetch store. Error : ${error}"));
    return store;
  }
}
