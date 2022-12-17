import 'package:flutter/material.dart';
import 'package:flutterdemo/models/order_model.dart';
import 'package:flutterdemo/screens/order_details/widgets/details_card.dart';
import 'package:flutterdemo/screens/order_details/widgets/products_card.dart';
import 'package:flutterdemo/screens/order_details/widgets/total_card.dart';
import 'package:flutterdemo/screens/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutterdemo/screens/widgets/layout.dart';


class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key, required this.order}) : super(key: key);

  final OrderJson order;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Order Details', backButton: true),
        body: Layout(
          widget: SingleChildScrollView(
            child: Column(
              children: [
                Text('ORDER ID: ${widget.order.id}',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center),
                Text('Placed on: ${widget.order.date_created.toString().split(' ')[0]}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                DetailsCard(order: widget.order),
                ProductsCard(order: widget.order),
                TotalCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



