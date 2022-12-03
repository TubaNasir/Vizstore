import 'package:flutter/material.dart';

import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';

class DeleteIcon extends StatefulWidget {
  const DeleteIcon(
      {Key? key,
        required this.product})
      : super(key: key);

  final ProductJson product;

  @override
  State<DeleteIcon> createState() => _DeleteIconState();
}

class _DeleteIconState extends State<DeleteIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: () {
        setState(() {
          //widget.cartList.remove(widget.product);
        });
      },
      icon: Icon(
        Icons.delete_outline,
        color: Colors.red.shade900,
        size: 25,
      ),
    );
  }
}