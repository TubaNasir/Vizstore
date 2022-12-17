import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/checkout_provider.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/success/success.dart';
import 'package:provider/provider.dart';

class CheckoutBottomBar extends StatefulWidget {
  const CheckoutBottomBar({
    Key? key,
    this.Globalkey,
  }) : super(key: key);

  final Globalkey;

  @override
  State<CheckoutBottomBar> createState() => _CheckoutBottomBarState();
}

class _CheckoutBottomBarState extends State<CheckoutBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -8.0,
      bottom: 0,
      width: MediaQuery.of(context).size.width + 8,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFA7B2AD), Colors.white],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: TextColor1),
                  ),
                  Text(
                    context.watch<CheckoutProvider>().total.toString(),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 + 8,
              height: 78,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () async {
                  if (widget.Globalkey.currentState!.validate()) {
                    await context.read<CheckoutProvider>().placeOrder();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Success(),
                      ),
                    );
                  }
                },
                child: Ink(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    gradient: PrimaryGradientColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80.0),
                        bottomLeft: Radius.circular(80.0)),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Place Order',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: TextColor1, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
