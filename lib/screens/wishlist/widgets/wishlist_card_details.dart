import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/wishlist_provider.dart';

class TitleWidgetWishlist extends StatelessWidget {
  const TitleWidgetWishlist({
    Key? key,
    required this.title,
    required this.price,
    required this.storeName,
    required this.onPressed,
  }) : super(key: key);

  final String title, storeName;
  final int price;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red, size: 25),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: onPressed,
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Text(storeName, style: Theme.of(context).textTheme.bodySmall),
            SizedBox(
              height: 5,
            ),
            Text(
              "Rs. ${price}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
