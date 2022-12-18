import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/checkout_provider.dart';
import 'package:flutterdemo/screens/checkout/widgets/bottom_bar.dart';
import 'package:flutterdemo/screens/checkout/widgets/checkout_form.dart';
import 'package:flutterdemo/screens/checkout/widgets/order_summary.dart';
import 'package:flutterdemo/screens/widgets/custom_app_bar.dart';
import 'package:flutterdemo/screens/widgets/layout.dart';
import 'package:provider/provider.dart';

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
      context.read<CheckoutProvider>().setIsFetchingTrue(),
      await context.read<CheckoutProvider>().getProductsList(),
      await context.read<CheckoutProvider>().getStoresList(),
      context.read<CheckoutProvider>().setTotal(),
      context.read<CheckoutProvider>().setIsFetchingFalse(),
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
                context.watch<CheckoutProvider>().isFetching
                    ? Center(child: CircularProgressIndicator())
                    :
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
                CheckoutBottomBar(Globalkey: _formKey),
              ],
            ),
        ),
        ),

    );
  }
}





