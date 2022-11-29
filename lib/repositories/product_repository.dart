import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/product_model.dart';

class ProductRepository{
  final db = FirebaseFirestore.instance;

  Future<List<Product>> getProductList() async {
    List<Product> products = [];
    await db.collection("product").get().then((event) {
      products = event.docs.map((e) => Product.fromJson(e.data(), e.id)).toList();
    }).catchError((error) => print("Failed to fetch products. Error : ${error}"));
    ;
    return products;
  }
}