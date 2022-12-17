import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/cart_provider.dart';
import 'package:flutterdemo/models/cart_json.dart';
import 'package:flutterdemo/models/store_json.dart';
import 'package:flutterdemo/screens/widgets/image_widget.dart';
import 'package:provider/provider.dart';
import '../../../models/product_json.dart';
import '../../product_detail/product_detail.dart';
import 'cart_quantity.dart';
import 'delete_icon.dart';

class CartCard extends StatefulWidget {
  const CartCard({Key? key, required this.cartItem}) : super(key: key);

  final CartItemJson cartItem;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    ProductJson product =
        context.read<CartProvider>().getProductInfo(widget.cartItem.productId);
    StoreJson store = context.read<CartProvider>().getStore(product.storeId);
    bool isFetching = context.watch<CartProvider>().isFetching;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: isFetching
          ? SizedBox(
              height: 88.0,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 2,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: Center(child: CircularProgressIndicator()),
              ),
            )
          : ElevatedButton(
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
                  ImageWidget(image: product.image),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        product.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    DeleteIcon(product: product),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(store.storeName,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Rs. ${product.price}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      CartQuantity(cartItem: widget.cartItem),
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
