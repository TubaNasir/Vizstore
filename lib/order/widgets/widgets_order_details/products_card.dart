import 'package:flutterdemo/constants.dart';
import 'package:flutter/material.dart';
import '../../order_model.dart';
import 'horizontal_product_card.dart';

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
                      itemCount: widget.order.products.length,
                      itemBuilder: (context, index) => HorizontalProductCard(
                        productImage: widget.order.products[index].image,
                        cardTitle: widget.order.products[index].title,
                        cardSubtitle: "Rs. ${widget.order.products[index].price}",
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor: PrimaryColor,
                          child:
                              Text(widget.order.products[index].quantity.toString(),style: TextStyle(color: Colors.black),),
                        ),
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
