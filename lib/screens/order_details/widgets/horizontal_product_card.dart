import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/order_details/widgets/image_widget_product.dart';
import 'package:flutterdemo/screens/order_details/widgets/title_widget_product.dart';

class HorizontalProductCard extends StatelessWidget {
  HorizontalProductCard({
    Key? key,
    required this.productImage,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.icon,
  }) : super(key: key);

  final String productImage;
  final String cardTitle, cardSubtitle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            ImageWidgetProduct(productImage: productImage),
        SizedBox(
          width: 20,
        ),
        TitleWidgetProduct(cardTitle: cardTitle, cardSubtitle: cardSubtitle),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        )
        ],
      ),
    ),);
  }
}






