import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/order_details_provider.dart';
import 'package:flutterdemo/models/cart_item_json.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/order_details/widgets/image_widget_product.dart';
import 'package:flutterdemo/screens/order_details/widgets/title_widget_product.dart';
import 'package:provider/provider.dart';

class HorizontalProductCard extends StatefulWidget {
  HorizontalProductCard({
    Key? key,
    required this.cartItem
  }) : super(key: key);

  final CartItemJson cartItem;

  @override
  State<HorizontalProductCard> createState() => _HorizontalProductCardState();
}

class _HorizontalProductCardState extends State<HorizontalProductCard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {

    });
  }

  @override
  Widget build(BuildContext context) {
    ProductJson product = context.read<OrderDetailsProvider>().getProductInfo(widget.cartItem.productId);
    bool isFetching = context.watch<OrderDetailsProvider>().isFetching;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: isFetching
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
      )
          :ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            ImageWidgetProduct(productImage: product.image),
        SizedBox(
          width: 20,
        ),
        TitleWidgetProduct(cardTitle: product.title, cardSubtitle: product.price.toString()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 12,
            backgroundColor: PrimaryColor,
            child: Text(
              widget.cartItem.quantity.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
        ],
      ),
    ),);
  }
}






