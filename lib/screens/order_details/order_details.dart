import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/order_details_provider.dart';
import 'package:flutterdemo/models/order_json.dart';
import 'package:flutterdemo/screens/order_details/widgets/details_card.dart';
import 'package:flutterdemo/screens/order_details/widgets/products_card.dart';
import 'package:flutterdemo/screens/order_details/widgets/total_card.dart';
import 'package:flutterdemo/screens/widgets/custom_app_bar.dart';
import 'package:flutterdemo/screens/widgets/layout.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key, required this.order}) : super(key: key);

  final OrderJson order;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
      await context.read<OrderDetailsProvider>().setIsFetchingTrue(),
      await context.read<OrderDetailsProvider>().getUser(),
      await context.read<OrderDetailsProvider>().getProductsList(),
      await context.read<OrderDetailsProvider>().getStore(widget.order.storeId),
      //await context.read<OrderDetailsProvider>().getOrderList(),
      //await context.read<OrderDetailsProvider>().getMyOrders(),
      await context.read<OrderDetailsProvider>().setIsFetchingFalse(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Order Details', backButton: true),
        body: context.watch<OrderDetailsProvider>().isFetching
            ? Center(child: CircularProgressIndicator())
            :Layout(
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
                TotalCard(order: widget.order),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



