import 'package:flutterdemo/controllers/order_details_provider.dart';
import 'package:flutterdemo/models/order_json.dart';
import 'package:flutterdemo/models/store_json.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'horizontal_product_card.dart';

class ProductsCard extends StatefulWidget {
  const ProductsCard({
    Key? key, required this.order
  }) : super(key: key);

  final OrderJson order;

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  @override
  Widget build(BuildContext context) {
    StoreJson store = context.watch<OrderDetailsProvider>().store;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
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
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        store.storeName,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Products: ',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const Divider(
                    color: SecondaryColor,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: widget.order.cart.length,
                    itemBuilder: (context, index) => HorizontalProductCard(
                      productImage: context
                          .read<OrderDetailsProvider>()
                          .getProductInfo(widget.order.cart[index].productId)
                          .image,
                      cardTitle: context
                          .read<OrderDetailsProvider>()
                          .getProductInfo(widget.order.cart[index].productId)
                          .title,
                      cardSubtitle:
                          "Rs. ${context.read<OrderDetailsProvider>().getProductInfo(widget.order.cart[index].productId).price}",
                      icon: CircleAvatar(
                        radius: 15,
                        backgroundColor: PrimaryColor,
                        child: Text(
                          widget.order.cart[index].quantity.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
