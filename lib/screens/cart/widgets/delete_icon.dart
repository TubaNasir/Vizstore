import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../../../models/product_json.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon(
      {Key? key,
        required this.product})
      : super(key: key);

  final ProductJson product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      color: Colors.red.shade400,
      onPressed: () {
        context.read<CartProvider>().removeFromCart(product.id);
      },
      constraints: BoxConstraints(),
      icon: Icon(Icons.delete_outline, size: 20),
    );
  }
}
