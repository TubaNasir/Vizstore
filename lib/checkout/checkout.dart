import 'package:camera/camera.dart';
import 'package:flutterdemo/checkout/widgets/checkout_form.dart';
import 'package:flutterdemo/checkout/widgets/order_summary.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/success/success.dart';
import 'package:flutterdemo/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutterdemo/widgets/layout.dart';
import 'package:flutterdemo/widgets/suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/form_field.dart';

class Checkout extends StatefulWidget {
  final CameraDescription camera;
  const Checkout({required this.camera,super.key});

  @override
  State<Checkout> createState() => _CheckoutState(camera);
}

class _CheckoutState extends State<Checkout> {
  final CameraDescription camera;
  _CheckoutState(this.camera);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: 'Checkout', backButton: true),
        body: Stack(
            children:[
              Layout(
                widget:
              Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CheckoutForm(),
                        OrderSummary(),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                )],
                ),
              ),
              CheckoutBottomBar(camera: camera),
            ],
          ),
        ),

    );
  }
}

class CheckoutBottomBar extends StatelessWidget {
  const CheckoutBottomBar({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -8.0,
      //left: -8.0,
      bottom: 0,
      width: MediaQuery.of(context).size.width +8,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, -3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2,
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
                  Text('Total',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: TextColor1),
                  ),
                  Text('Rs. 1200',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2 + 8,
              height: 78,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Success(camera: camera,),
                    ),
                  );
                },
                child: Ink(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    gradient: PrimaryGradientColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(80.0), bottomLeft: Radius.circular(80.0)),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Place Order',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: TextColor1),
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




