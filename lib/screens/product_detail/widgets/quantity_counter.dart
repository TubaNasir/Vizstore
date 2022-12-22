import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/product_details_provider.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:provider/provider.dart';

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
                  onPressed: widget.product.stock == 0 ? null : () async {
                    await context.read<ProductDetailsProvider>().decrementQuantity(widget.product.id);
                  },
                  icon: CircleAvatar(
                      radius: 20,
                      backgroundColor: widget.product.stock == 0 ? SecondaryDarkColor : PrimaryColor,
                      child: const Icon(
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
                  onPressed: widget.product.stock == 0 ? null : () async {
                    await context.read<ProductDetailsProvider>().incrementQuantity(widget.product.id);
                  },
                  icon: CircleAvatar(
                      radius: 20,
                      backgroundColor: widget.product.stock == 0 ? SecondaryDarkColor : PrimaryColor,
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 20,
                      ))),
            ]),
      ],
    );
  }
}
