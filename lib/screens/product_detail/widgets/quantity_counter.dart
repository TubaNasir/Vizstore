import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';

import '../../../models/product_model.dart';

class QuantityCounter extends StatefulWidget {
  QuantityCounter({required this.product, Key? key}) : super(key: key);

  Product product;
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
                    setState(() {
                      //widget.actualProduct.qty--;
                      if (widget.product.stock == 0) {
                        return;
                      } else {
                        widget.product.stock--;
                      }
                    });
                    setState(() {});
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
                " ${"1"} ",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.product.stock++;
                    });
                    setState(() {});
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
