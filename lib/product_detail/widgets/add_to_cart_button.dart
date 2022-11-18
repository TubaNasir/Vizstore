import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/checkout/checkout.dart';
import 'package:flutterdemo/constants.dart';

import '../../cart/cart.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2 + 8,
      height: 78,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Cart(camera: camera,),
            ),
          );
        },
        child: Ink(
          decoration: const BoxDecoration(
            color: Colors.white,
            gradient: PrimaryGradientColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(80.0), bottomLeft: Radius.circular(80.0)),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Add to Cart',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}