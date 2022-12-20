import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/cart_provider.dart';
import 'package:flutterdemo/models/cart_item_json.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class CartQuantity extends StatefulWidget {
  const CartQuantity(
      {Key? key,
        required this.cartItem})
      : super(key: key);

  final CartItemJson cartItem;

  @override
  State<CartQuantity> createState() => _CartQuantityState();
}

class _CartQuantityState extends State<CartQuantity> {

  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        context.read<CartProvider>().getUser());
  }

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
                context.read<CartProvider>().decrementCartItem(widget.cartItem.productId, widget.cartItem.quantity);
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
            "${widget.cartItem.quantity.toString()}",
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
                context.read<CartProvider>().incrementCartItem(widget.cartItem.productId, widget.cartItem.quantity);
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
