import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductJson product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
       // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          border: Border.all(color: SecondaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.70,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: SecondaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                    ),
                    child: Image.network(product.image)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(product.title,
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 1,),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Rs. ${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: TextColor1)
                          ),
                          Icon(Icons.favorite,
                          color: Colors.grey,),
                          // Container(
                          //   height: 28,
                          //   width: 28,
                          //   decoration: BoxDecoration(
                          //       color: SecondaryColor,
                          //       shape: BoxShape.circle),
                          //   child: Icon(Icons.favorite),
                          // ),
                        ],
                      ),
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
