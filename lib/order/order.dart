import 'package:flutter/material.dart';
import '../../widgets/horizontal_card.dart';
import '../constants.dart';
import '../widgets/customAppBar.dart';
import 'order_details.dart';
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
      body: OrderBody(),
    );
  }
}







