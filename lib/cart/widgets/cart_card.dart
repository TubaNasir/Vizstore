import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';

import '../product_model.dart';

class CartCard extends StatefulWidget {
  const CartCard(
      {Key? key,
      required this.product,
      required this.cartList,
      required this.onCartChanged})
      : super(key: key); //required this.actualProduct}) : super(key: key);

  final List<Product1> cartList;
  final Product1 product;
  final VoidCallback onCartChanged;

  //final Product actualProduct;
  @override
  // ignore: no_logic_in_create_state
  State<CartCard> createState() => _CartCardState(cartList, onCartChanged);
}

class _CartCardState extends State<CartCard> {
  final List<Product1> cartList;
  final VoidCallback onCartChanged;

  _CartCardState(this.cartList, this.onCartChanged);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 5,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 1.11,
                child: Container(
                    //width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: SecondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Image.network(widget.product.image)),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
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
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    setState(() {
                                      cartList.remove(widget.product);
                                    });
                                    onCartChanged();
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red.shade900,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                Text("Store name",
                                    style: Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  "Rs. ${widget.product.price}",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        onPressed: () {
                                          setState(() {
                                            widget.product.qty--;
                                            //widget.actualProduct.qty--;
                                            if (widget.product.qty < 1) {
                                              cartList.remove(widget.product);
                                            }
                                          });
                                          onCartChanged();
                                        },
                                        icon: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: PrimaryColor,
                                          child: Icon(Icons.remove,color: Colors.black,size: 20,)
                                        )
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          "${widget.product.qty}",
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                      ),
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: () {
                                            setState(() {
                                              widget.product.qty++;
                                            });
                                            onCartChanged();
                                          },
                                          icon: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: PrimaryColor,
                                            child: Icon(Icons.add,color: Colors.black,size: 20,)
                                          )
                                        ),
                                    ]),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}