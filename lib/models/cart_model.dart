

import 'package:flutterdemo/models/product_model.dart';

class CartObject {
  Product product;
  int quantity;

  CartObject({
    required this.product,
    required this.quantity
});

  Map<String, dynamic> toJson() => {
    "product": product,
    "quantity": quantity,
  };
}