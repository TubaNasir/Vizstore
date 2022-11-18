import 'package:flutter/material.dart';
import 'package:flutterdemo/wishlist/widgets/wishlist_card.dart';
import '../../home/home_model.dart';
import '../wishlist.dart';

class WishlistBody extends StatelessWidget {
  const WishlistBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            children: demoProducts
                .map((e) => WishListCard(
              productImage: e.image,
              title: e.title,
              price: "Rs. ${e.price}",
              icon: Icon(
                Icons.favorite,
                color: (fav == true ? Colors.red : Colors.grey),
                size: 20,
              ),
              press: () {}, storeName: 'lala',
            ))
                .toList(),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}