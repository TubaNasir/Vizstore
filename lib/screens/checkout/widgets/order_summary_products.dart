import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/cart_provider.dart';
import 'package:flutterdemo/controllers/checkout_provider.dart';
import 'package:flutterdemo/models/cart_model.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/models/store_model.dart';
import 'package:flutterdemo/models/user_model.dart';
import 'package:flutterdemo/screens/cart/cart.dart';
import 'package:provider/provider.dart';

class OrderSummaryProducts extends StatefulWidget {
  const OrderSummaryProducts({Key? key, required this.store}) : super(key: key);

  final StoreJson store;

  @override
  State<OrderSummaryProducts> createState() => _OrderSummaryProductsState();
}

class _OrderSummaryProductsState extends State<OrderSummaryProducts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
          await context.read<CheckoutProvider>().getUser(),
        });
  }

  @override
  Widget build(BuildContext context) {
    print('in os');
    List<CartItemJson> cart = context.watch<CartProvider>().user.cart;

    List<CartItemJson> cartProducts =
        context.read<CheckoutProvider>().getProductsFromStore(widget.store.id);

    return Column(
      children: [
        Column(
            children: cartProducts.map((element) => Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // context.read<CheckoutProvider>().getProduct(e.productId),
                          '${context.read<CheckoutProvider>().getProduct(element.productId).title}   ${element.quantity}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text('Rs. ${(context.read<CheckoutProvider>().getProduct(element.productId).price*element.quantity).toString()}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                )
                .toList()),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery fee:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text('Rs. ${widget.store.deliveryCharges}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
              ),
            ],
          ),
        ),
      ],
    );
  }
}
