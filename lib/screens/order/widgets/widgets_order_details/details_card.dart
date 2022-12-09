import 'package:flutterdemo/controllers/my_orders_provider.dart';
import 'package:flutterdemo/models/order_model.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../order_model.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({
    Key? key, required this.order
  }) : super(key: key);

  final OrderJson order;



  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {

  @override
  Widget build(BuildContext context) {
    //OrderJson order = context.watch<MyOrdersProvider>().clickedOrder;

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping details: ',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const Divider(
                  color: SecondaryColor,
                ),
                /*Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contact #: ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '${order.contact}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Address:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        widget.order.address,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        widget.order.status,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: widget.order.status == 'confirmed'
                                ? Colors.green
                                : widget.order.status == 'cancelled'
                                    ? Colors.red
                                    : Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
