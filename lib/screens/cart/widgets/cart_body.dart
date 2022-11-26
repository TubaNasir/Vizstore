import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../checkout/checkout.dart';
import '../../widgets/custom_button.dart';
import 'cart_card.dart';
import 'total_card_cart.dart';

class CartBody extends StatefulWidget {
  CartBody({Key? key, required this.camera, required this.cartList}) : super(key: key);
  final List<Product> cartList;
  final CameraDescription camera;
  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Column(
          children: widget.cartList
              .map((e) => CartCard(
            product: e,
            cartList: widget.cartList,
            onCartChanged: () {
              setState(() {});
            },
            camera: widget.camera,
          ))
              .toList(),
        ),
        TotalCardCart(),
        SizedBox(height: 20),
        CustomButton(
          text: 'Checkout',
          pressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Checkout(
                  camera: widget.camera,
                )));
          },
        ),
        SizedBox(height: 100),
      ]),
    );
  }
}


