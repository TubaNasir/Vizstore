import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/product_details_provider.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class QuantityCounter extends StatefulWidget {
  QuantityCounter({required this.product, Key? key}) : super(key: key);

  ProductJson product;
  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    context.read<ProductDetailsProvider>().decrementQuantity();
                  },
                  icon: const CircleAvatar(
                      radius: 20,
                      backgroundColor: PrimaryColor,
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 20,
                      ))),
              Text(
                context.watch<ProductDetailsProvider>().quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    context.read<ProductDetailsProvider>().incrementQuantity();
                  },
                  icon: const CircleAvatar(
                      radius: 20,
                      backgroundColor: PrimaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 20,
                      ))),
            ]),
      ],
    );
  }
}
