

import 'package:flutterdemo/models/product_model.dart';

class WishlistItemJson {
  final String productId;

  WishlistItemJson({
    required this.productId
});

  static WishlistItemJson fromJson(Map<String, dynamic> json) => WishlistItemJson(
    productId: json["productId"],
  );

  Map<String, dynamic> toJson() =>{
    "productId": productId
};
}