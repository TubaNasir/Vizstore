import 'package:flutter/material.dart';
import 'package:flutterdemo/home/home_model.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              product.title,
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
          child: Center(
            child: Icon(
              Icons.favorite_border_rounded,
              size: 30,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
      ],
    );
  }
}
