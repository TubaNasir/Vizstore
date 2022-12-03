import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/wishlist/widgets/wishlist_card.dart';
import '../../../models/product_model.dart';
import '../wishlist.dart';

class WishlistCards extends StatelessWidget {
  const WishlistCards({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: demoProducts
          .map((e) => WishListCard(
        productImage: e.image,
        title: e.title,
        price: "Rs. ${e.price}",
        icon: Icon(
          Icons.favorite,
          color: (fav == true ? Colors.red : Colors.grey),
          size: 25,
        ),
        storeName: 'Store Name',
      ))
          .toList(),
    );
  }
}
