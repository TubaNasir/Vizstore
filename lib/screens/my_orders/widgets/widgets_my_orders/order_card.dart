import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/my_orders_provider.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:provider/provider.dart';
import 'title_widget_order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(
      {Key? key,
      required this.title,
      required this.placedOn,
      required this.status,
      required this.press})
      : super(key: key);

  final String title, placedOn, status;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    bool isFetching = context.watch<MyOrdersProvider>().isFetching;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: isFetching
          ? SizedBox(
              height: 50.0,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 2,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: SizedBox(
                    height: 16,
                    width: 16,
                    child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                        )
                    )
                ),
              ),
            )
          : ElevatedButton(
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
                  const SizedBox(
                    width: 20,
                  ),
                  TitleWidgetOrder(
                      title: title, status: status, placedOn: placedOn),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.chevron_right,
                      color: PrimaryColor,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
