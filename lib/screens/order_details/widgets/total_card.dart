import 'package:flutterdemo/controllers/checkout_provider.dart';
import 'package:flutterdemo/models/order_json.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalCard extends StatelessWidget {
  const TotalCard({Key? key, required this.order}) : super(key: key);

  final OrderJson order;

  @override
  Widget build(BuildContext context) {
    int total = context.watch<CheckoutProvider>().total;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
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
                      'Total: ',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Rs. ${order.total}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
