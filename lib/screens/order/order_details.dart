import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/order/widgets/widgets_order_details/details_card.dart';
import 'package:flutterdemo/screens/order/widgets/widgets_order_details/products_card.dart';
import 'package:flutterdemo/screens/order/widgets/widgets_order_details/total_card.dart';

import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/layout.dart';
import 'order_model.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Order Details', backButton: true),
        body: Layout(
          widget: SingleChildScrollView(
            child: Column(
              children: [
                Text('ORDER ID: ${order.id}',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center),
                Text('Placed on: ${order.placedOn}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                DetailsCard(order: order,),
                ProductsCard(order: order,),
                TotalCard(order: order,),
              ],
            ),
          ),
        ),
      ),
    );
  }


}


