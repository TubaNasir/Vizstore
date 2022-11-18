import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/storeManager/orders/widgets/horizontal_order_card.dart';
import 'package:flutterdemo/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../order/order_model.dart';
import 'order_detail_store.dart';

class Orders extends StatelessWidget {
   Orders({Key? key}) : super(key: key);

  int selectedIndex = 0; //STATE MGMT

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Orders",
          backButton: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OrderStatus(),
              selectedIndex == 0 ?
              OrderCard(orderList: demoOrders) :
              selectedIndex == 1 ?
              OrderCard(orderList: demoOrders.where((e) => e.status == 'Pending').toList()) :
              selectedIndex == 2 ?
              OrderCard(orderList: demoOrders.where((e) => e.status == 'Confirmed').toList()) :
              selectedIndex == 3 ?
              OrderCard(orderList: demoOrders.where((e) => e.status == 'Cancelled').toList()) :
              OrderCard(orderList: demoOrders)

            ],
          ),
        ));
  }
}

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key,}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  List<String> status = ["All", "Pending", "Confirmed", "Cancelled"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: status.length,
        itemBuilder: (context, index) => StatusWidget(index),
      ),
    );
  }

  Widget StatusWidget(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text(
              status[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index
                      ? PrimaryColor
                      : PrimaryLightColor),
            ),
            Container(
              // margin: EdgeInsets.only(top: 20/3),
              height: 2,
              width: 50,
              color: selectedIndex == index ? PrimaryColor : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key, required this.orderList}) : super(key: key);

  final List<Order> orderList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: orderList.length,
        itemBuilder: (context, index) =>
            HorizontalOrderCard(
                productImage: orderList[index].products.first.image,
                cardTitle: "Order ID: ${orderList[index].id}",
                cardSubtitle: '${orderList[index].placedOn}\n${orderList[index].status}',
                icon: Icon(
                  Icons.chevron_right,
                  color: PrimaryColor,
                ),
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderDetailStore(ord: orderList[index]),
                    ),
                  );
                }),),
    );
    //     body: ListView(
    //   children: demoOrders
    //       .map((e) => HorizontalCard(
    //           productImage: e.products.first.image,
    //           cardTitle: "Order ID: " + e.id.toString(),
    //           cardSubtitle: e.placedOn.toString() + '\n' + e.status,
    //           icon: Icon(
    //             Icons.chevron_right,
    //             color: PrimaryColor,
    //           ),
    //           press: () {
    //             Navigator.of(context).push(
    //               MaterialPageRoute(
    //                 builder: (context) => OrderDetailStore(ord: e),
    //               ),
    //             );
    //           }))
    //       .toList(),
    // ));
  }
}
