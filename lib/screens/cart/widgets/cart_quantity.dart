import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../constants.dart';

class CartQuantity extends StatefulWidget {
  const CartQuantity(
      {Key? key,
      required this.cartList,
      required this.product,
      required this.onCartChanged})
      : super(key: key);
  final List<Product> cartList;
  final Product product;
  final VoidCallback onCartChanged;

  @override
  State<CartQuantity> createState() => _CartQuantityState();
}

class _CartQuantityState extends State<CartQuantity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          height: 25,
          width: 25,
          child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                setState(() {
                  widget.product.quantity--;
                  //widget.actualProduct.quantity--;
                  if (widget.product.quantity < 1) {
                    widget.cartList.remove(widget.product);
                  }
                });
                widget.onCartChanged();
              },
              icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: PrimaryColor,
                  child: Icon(
                    Icons.remove,
                    color: Colors.black,
                    size: 20,
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "${widget.product.quantity}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: 25,
          width: 25,
          child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                setState(() {
                  widget.product.quantity++;
                });
                widget.onCartChanged();
              },
              icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: PrimaryColor,
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 20,
                  ))),
        ),
      ]),
    );
  }
}
