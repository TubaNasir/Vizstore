

import 'package:flutterdemo/models/product_model.dart';

class CartItemJson {
  String productId;
  int stock;

  CartItemJson({
    required this.productId,
    required this.stock
});

  static CartItemJson fromJson(Map<String, dynamic> json) => CartItemJson(
    productId: json["productId"],
    stock: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "product": productId,
    "stock": stock,
  };


}