import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/cart_provider.dart';
import 'package:flutterdemo/models/cart_model.dart';
import 'package:flutterdemo/models/store_model.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';
import '../../product_detail/product_detail.dart';
import 'cart_quantity.dart';
import 'delete_icon.dart';
import 'image_widget_cart.dart';

class CartCard extends StatefulWidget {
  const CartCard(
      {Key? key,
      required this.cartItem})
      : super(key: key); //required this.actualProduct}) : super(key: key);

  final CartItemJson cartItem;

  //final Product actualProduct;
  @override
  // ignore: no_logic_in_create_state
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {

  _CartCardState();

@override
void initState()  {
  // TODO: implement initState
  super.initState();
  //WidgetsBinding.instance.addPostFrameCallback((_) =>
      //context.read<CartProvider>().setProduct(widget.cartItem.productId));
      //context.read<CartProvider>().getUser();
}
  @override
  Widget build(BuildContext context) {

    ProductJson product = context.watch<CartProvider>().getProduct(widget.cartItem.productId);
   // StoreJson store = context.watch<CartProvider>().getStore(widget.cartItem.productId);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetail(
                product: product,
              )));
        },
        style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageWidgetCart(image: product.image),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  product.title,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DeleteIcon(
                                  product: product),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text('My store',
                              style: Theme.of(context).textTheme.bodySmall),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rs. ${product.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                CartQuantity(
                                    cartItem: widget.cartItem),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



