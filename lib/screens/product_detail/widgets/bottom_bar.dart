import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/product_detail/widgets/quantity_counter.dart';

import '../../home/home_model.dart';
import 'add_to_cart_button.dart';

class BottomBar extends StatefulWidget {
  BottomBar({required this.product, required this.camera, Key? key}) : super(key: key);

  Product product;
  CameraDescription camera;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width + 8,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, -3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFA7B2AD), Colors.white],
                ),
              ),
              child: QuantityCounter(product: widget.product),
            ),
            AddToCartButton(camera: widget.camera),
          ],
        ),
      ),
    );
  }
}
