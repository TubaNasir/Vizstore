import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/checkout_provider.dart';
import 'package:flutterdemo/models/cart_model.dart';
import 'package:flutterdemo/screens/checkout/widgets/bottom_bar.dart';
import 'package:flutterdemo/screens/checkout/widgets/order_summary.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/layout.dart';
import 'widgets/checkout_form.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key, });


  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
      await context.read<CheckoutProvider>().getProductsList(),
      await context.read<CheckoutProvider>().getStoresList(),
      context.read<CheckoutProvider>().setTotal()
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: 'Checkout', backButton: true),
        body: Form(
          key: _formKey,
          child: Stack(
              children:[
                Layout(
                  widget:
                Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CheckoutForm(key: _formKey,),
                          OrderSummary(),
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                  )],
                  ),
                ),
                CheckoutBottomBar(),
              ],
            ),
        ),
        ),

    );
  }
}





