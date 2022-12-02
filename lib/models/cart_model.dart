

import 'package:flutterdemo/models/product_model.dart';

class CartItemJson {
  String productId;
  int quantity;

  CartItemJson({
    required this.productId,
    required this.quantity
});

  static CartItemJson fromJson(Map<String, dynamic> json) => CartItemJson(
    productId: json["productId"] as String? ?? '',
    quantity: json["quantity"] as int? ?? -1,
  );

  Map<String, dynamic> toJson() => {
    "product": productId,
    "quantity": quantity,
  };


}