import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/order/order_details.dart';
import 'package:flutterdemo/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import '../../widgets/horizontal_card.dart';
import 'order_model.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Orders',
        backButton: true,
      ),
      body: ListView(
          children: demoOrders
              .map((e) => HorizontalCard(
            productImage: e.products.first.image,
            cardTitle: "Order ID: " + e.
            id.toString(),
            cardSubtitle: e.placedOn.toString() + '\n' + e.status,
            icon: Icon(Icons.chevron_right, color: PrimaryColor,),
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderDetails(order: e,),
                ),
              );
            },
          ))
              .toList()),
    );
  }
}

