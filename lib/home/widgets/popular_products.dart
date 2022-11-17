import 'package:flutterdemo/home/home_model.dart';
import 'package:flutterdemo/widgets/product.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: demoProducts
                  .map((product) => Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: ProductCard(product: product),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
