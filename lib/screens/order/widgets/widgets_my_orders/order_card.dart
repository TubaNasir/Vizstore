import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/my_orders_provider.dart';
import 'package:provider/provider.dart';
import '../../../widgets/image_widget.dart';
import 'title_widget_order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key, required this.productImage, required this.title, required this.placedOn, required this.status, required this.icon, required this.press}) : super(key: key);

  final String productImage;
  final String title, placedOn, status;
  final Widget icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {

    bool isFetching = context.watch<MyOrdersProvider>().isFetching;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child:
      isFetching
          ? SizedBox(
        height: 88.0,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 2,
              padding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: () {},
          child: Center(child: CircularProgressIndicator()),
        ),
      ) : ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //ImageWidget(image: productImage),
            const SizedBox(
              width: 20,
            ),
            TitleWidgetOrder(title: title, status: status, placedOn: placedOn),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: icon,
            )
          ],
        ),
      ),
    );
  }
}