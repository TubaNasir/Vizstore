

import 'package:flutterdemo/models/product_model.dart';

class WishlistItemJson {
  final String productId;

  WishlistItemJson({
    required this.productId
});

  Map<String, dynamic> toJson() =>{
    "productId": productId

};
}