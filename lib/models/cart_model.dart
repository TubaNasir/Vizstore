

import 'package:flutterdemo/models/product_model.dart';

class Cart {
  List<Product> products;
  int quantity;

  Cart({
    required this.products,
    required this.quantity
});
}