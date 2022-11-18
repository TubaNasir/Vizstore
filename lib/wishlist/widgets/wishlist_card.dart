import 'package:flutter/material.dart';
import 'package:flutterdemo/wishlist/widgets/title_widget_wishlist.dart';
import '../../widgets/image_widget.dart';

class WishListCard extends StatelessWidget {
  const WishListCard(
      {Key? key,
        required this.productImage,
        required this.title,
        required this.price,
        required this.icon,
        required this.press, required this.storeName})
      : super(key: key);

  final String productImage;
  final String title, price, storeName;
  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageWidget(productImage: productImage),
            SizedBox(
              width: 20,
            ),
            TitleWidgetWishlist(title: title, icon: icon, price: price),
          ],
        ),
      ),
    );
  }
}