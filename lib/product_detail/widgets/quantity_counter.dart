import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/home/home_model.dart';

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
                      if (widget.product.quantity == 0) {
                        return;
                      } else {
                        widget.product.quantity--;
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
                " ${widget.product.quantity} ",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.product.quantity++;
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