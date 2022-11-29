

import 'package:flutterdemo/models/product_model.dart';

class CartObject {
  Product product;
  int stock;

  CartObject({
    required this.product,
    required this.stock
});

  Map<String, dynamic> toJson() => {
    "product": product,
    "stock": stock,
  };
}