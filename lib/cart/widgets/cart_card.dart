import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/product_detail/product_detail.dart';
import '../../home/home_model.dart';
import 'cart_quantity.dart';
import 'delete_icon.dart';
import 'image_widget_cart.dart';

class CartCard extends StatefulWidget {
  const CartCard(
      {Key? key,
      required this.product,
      required this.cartList,
      required this.onCartChanged, required this.camera})
      : super(key: key); //required this.actualProduct}) : super(key: key);

  final List<Product> cartList;
  final Product product;
  final VoidCallback onCartChanged;
  final CameraDescription camera;


  //final Product actualProduct;
  @override
  // ignore: no_logic_in_create_state
  State<CartCard> createState() => _CartCardState(cartList, onCartChanged);
}

class _CartCardState extends State<CartCard> {
  final List<Product> cartList;
  final VoidCallback onCartChanged;

  _CartCardState(this.cartList, this.onCartChanged);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetail(
                camera: widget.camera,
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
            ImageWidgetCart(widget: widget),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
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
                                  widget.product.title,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DeleteIcon(
                                  cartList: cartList,
                                  product: widget.product,
                                  onCartChanged: onCartChanged),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text("Store name",
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
                                  "Rs. ${widget.product.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                CartQuantity(
                                    cartList: cartList,
                                    product: widget.product,
                                    onCartChanged: onCartChanged),
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



