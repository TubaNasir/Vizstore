import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';

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

class ImageWidgetProduct extends StatelessWidget {
  const ImageWidgetProduct({
    Key? key,
    required this.productImage,
  }) : super(key: key);

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      child: AspectRatio(
        aspectRatio: 1.11,
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
              color: SecondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              )
          ),
          child: Image.network(productImage),
        ),
      ),
    );
  }
}

class TitleWidgetProduct extends StatelessWidget {
  const TitleWidgetProduct(
      {Key? key, required this.cardTitle, required this.cardSubtitle})
      : super(key: key);
  final String cardTitle, cardSubtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                cardSubtitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}


