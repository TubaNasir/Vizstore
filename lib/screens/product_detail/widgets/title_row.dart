import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/product_details_provider.dart';
import 'package:provider/provider.dart';
import '../../../models/product_json.dart';

class TitleRow extends StatefulWidget {
  const TitleRow({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductJson product;

  @override
  State<TitleRow> createState() => _TitleRowState();
}

class _TitleRowState extends State<TitleRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              widget.product.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 5,
            ),
          ),
        ),
        Container(
            width: 50,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0)),
            ),
            child: InkWell(
              child: Center(
                  child: context
                          .watch<ProductDetailsProvider>()
                          .getIsFavourite(widget.product.id)
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: const Icon(Icons.favorite, size: 30),
                          color: Colors.red,
                          onPressed: () {
                            context
                                .read<ProductDetailsProvider>()
                                .updateWishlist(widget.product.id);
                          })
                      : IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: const Icon(Icons.favorite_border_rounded,
                              size: 30),
                          color: Colors.black.withOpacity(0.4),
                          onPressed: () {
                            context
                                .read<ProductDetailsProvider>()
                                .updateWishlist(widget.product.id);
                          })),
            )),
      ],
    );
  }
}
