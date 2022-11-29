import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutterdemo/models/store_model.dart";

class StoreRepository{
  final db = FirebaseFirestore.instance;

  Future<StoreJson> getStoreInfo(String id) async {

    StoreJson store = const StoreJson.empty();

    await db.collection("store").doc(id).get().then((event) {
      store = StoreJson.fromJson(event.data() as Map<String, dynamic>);
    }).catchError((error) => print("Failed to fetch store. Error : ${error}"));

    return store;
  }
}
