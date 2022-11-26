import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class DeleteIcon extends StatefulWidget {
  const DeleteIcon(
      {Key? key,
        required this.cartList,
        required this.product,
        required this.onCartChanged})
      : super(key: key);

  final List<Product> cartList;
  final Product product;
  final VoidCallback onCartChanged;

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
          widget.cartList.remove(widget.product);
        });
        widget.onCartChanged();
      },
      icon: Icon(
        Icons.delete_outline,
        color: Colors.red.shade900,
        size: 25,
      ),
    );
  }
}