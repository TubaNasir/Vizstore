import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/my_orders_provider.dart';
import 'package:flutterdemo/models/order_model.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/order/order_details.dart';
import 'package:flutterdemo/screens/order/widgets/widgets_my_orders/order_card.dart';
import 'package:flutterdemo/screens/widgets/layout.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
      context.read<MyOrdersProvider>().getUser(),
      await context.read<MyOrdersProvider>().getProductsList(),
      await context.read<MyOrdersProvider>().getOrderList(),
      //context.read<MyOrdersProvider>().getMyOrders(),

    });
  }

  @override
  Widget build(BuildContext context) {
    List<OrderJson> orderList = context.watch<MyOrdersProvider>().getMyOrders();

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'My Orders',
          backButton: true,
        ),
        body: Layout(
          widget: ListView(
              children: orderList
                  .map((e) => OrderCard(
                productImage: context.read<MyOrdersProvider>().getProduct(e.cart.first.productId).image,
                title: "Order ID: ${e.id}",
                placedOn: e.date_created.toString().split(' ')[0],
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







