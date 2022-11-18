import 'package:flutter/material.dart';
import 'package:flutterdemo/order/widgets/order_body.dart';
import '../widgets/customAppBar.dart';

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







