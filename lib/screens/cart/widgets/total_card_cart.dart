import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class TotalCardCart extends StatefulWidget {
  const TotalCardCart({super.key});

  @override
  State<TotalCardCart> createState() => _TotalCardCartState();
}

class _TotalCardCartState extends State<TotalCardCart> {
  @override
  Widget build(BuildContext context) {
    bool isFetching = context.watch<CartProvider>().isFetching;

    return isFetching
        ? Container()
        : Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: SecondaryColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SubTotal: ',
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          ("Rs. ${context.watch<CartProvider>().subTotal.toString()}"),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery: ',
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          ("Rs. ${context.watch<CartProvider>().delivery.toString()}"),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),
                      ],
                    ),
                    Divider(color: Colors.black12, height: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: ',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          ("Rs. ${context.watch<CartProvider>().total.toString()}"),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
