import 'package:camera/camera.dart';
import 'package:flutterdemo/checkout/widgets/bottom_bar.dart';
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





