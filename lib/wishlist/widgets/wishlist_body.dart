import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/wishlist/widgets/wishlist_card.dart';
import '../../home/home_model.dart';
import '../../product_detail/product_detail.dart';
import '../wishlist.dart';

class WishlistBody extends StatelessWidget {
  const WishlistBody({
    Key? key, required this.camera,
  }) : super(key: key);

  final CameraDescription camera;


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
                        size: 30,
                      ),
                      storeName: 'Store Name', camera: camera,
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
