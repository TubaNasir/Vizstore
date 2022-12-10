import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/cart_provider.dart';
import 'package:flutterdemo/controllers/checkout_provider.dart';
import 'package:flutterdemo/models/cart_model.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/models/store_model.dart';
import 'package:flutterdemo/models/user_model.dart';
import 'package:flutterdemo/screens/checkout/widgets/order_summary_products.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({
    Key? key,
  }) : super(key: key);



  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async =>
    {
      await context.read<CheckoutProvider>().getUser(),
    //context.read<CheckoutProvider>().getProductsInfo()
      context.read<CheckoutProvider>().setTotal()

    });

}

  @override
  Widget build(BuildContext context) {

    //context.watch<CheckoutProvider>().cartStores;
    //context.watch<CheckoutProvider>().getProductsInfo();
    //List<StoreJson> cartStores = context.watch<CheckoutProvider>().getProductsInfo();
  // List<StoreJson> cartStores = context.watch<CheckoutProvider>().cartStores;
    //int total =  context.watch<CheckoutProvider>().getTotal();


    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: SecondaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary: ',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const Divider(
                color: SecondaryColor,
              ),
              Column(children: context.watch<CheckoutProvider>().getProductsInfo().map((e) =>
              //unique stores.map
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.storeName, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
                      OrderSummaryProducts(store: e,),
                      SizedBox(height: 10,)
                    ],
                  )
                  ).toList() ),
              const Divider(
                color: SecondaryColor,
              ),
             /* Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery fee:',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Rs 100',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        context.watch<CheckoutProvider>().total.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

