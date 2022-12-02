import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/order/order_details.dart';
import 'package:flutterdemo/screens/order/order_model.dart';
import 'package:flutterdemo/screens/order/widgets/widgets_order/order_card.dart';
import 'package:flutterdemo/screens/widgets/layout.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'My Orders',
          backButton: true,
        ),
        body: Layout(
          widget: ListView(
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
                  .toList()),)
      ),
    );
  }
}







