import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../order_details.dart';
import '../../order_model.dart';
import 'order_card.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: demoOrders
            .map((e) => OrderCard(
          productImage: e.products.first.image,
          title: "Order ID: ${e.id}",
          placedOn: e.placedOn.toString(),
          status: e.status,
          icon: Icon(
            Icons.chevron_right,
            color: PrimaryColor,
          ),
          press: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OrderDetails(
                  order: e,
                ),
              ),
            );
          },
        ),)
            .toList());
  }
}