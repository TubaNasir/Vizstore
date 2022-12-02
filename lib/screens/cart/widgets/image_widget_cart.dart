import 'package:flutter/material.dart';

import '../../constants.dart';
import 'cart_card.dart';

class ImageWidgetCart extends StatelessWidget {
  const ImageWidgetCart({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          //width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: SecondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: Image.network(image)),
      ),
    );
  }
}
