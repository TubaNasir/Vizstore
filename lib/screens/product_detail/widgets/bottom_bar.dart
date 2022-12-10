import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/product_details_provider.dart';
import 'package:flutterdemo/screens/cart/cart.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/product_detail/widgets/quantity_counter.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class BottomBar extends StatelessWidget {
  BottomBar({required this.product,Key? key}) : super(key: key);

  ProductJson product;

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
              child: QuantityCounter(product: product),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2 + 8,
              height: 78,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: product.stock == 0 ? null : () {
                  context.read<ProductDetailsProvider>().addToCart(product.id);
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => Cart(),
                  //   ),
                  // );
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
            ),
          ],
        ),
      ),
    );
  }
}
