import 'package:flutter/material.dart';
import 'package:flutterdemo/order/widgets/widgets_order/order_body.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Orders',
        backButton: true,
      ),
      body: OrderBody(),
    );
  }
}







