import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/home/home_model.dart';
import 'package:flutterdemo/widgets/horizontal_card.dart';
import 'package:flutter/material.dart';

import '../order_model.dart';

class ProductsCard extends StatefulWidget {
  const ProductsCard({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  @override
  Widget build(BuildContext context) {
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
              height: 500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: order.products.length,
                      itemBuilder: (context, index) => HorizontalCard(
                        productImage: order.products[index].image,
                        cardTitle: order.products[index].title,
                        cardSubtitle: order.products[index].price.toString(),
                        icon: CircleAvatar(
                          radius: 15,
                          child:
                              Text(order.products[index].quantity.toString()),
                          backgroundColor: PrimaryColor,
                        ),
                        press: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
