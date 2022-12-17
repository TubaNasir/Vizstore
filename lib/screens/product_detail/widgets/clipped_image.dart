import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';
import '../../../models/product_json.dart';
import 'curve_clipper.dart';

class ClippedImage extends StatelessWidget {
  const ClippedImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductJson product;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveClipper(),
      child: Align(
        alignment: Alignment.topCenter,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: SecondaryColor,
            ),
            child: Image.network(product.image, fit: BoxFit.fitHeight),
          ),
        ),
      ),
    );
  }
}
