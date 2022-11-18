import 'package:flutter/material.dart';

class TitleWidgetWishlist extends StatelessWidget {
  const TitleWidgetWishlist({
    Key? key,
    required this.title,
    required this.icon,
    required this.price,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
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
                icon
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Text("Store name", style: Theme.of(context).textTheme.bodySmall),
            SizedBox(
              height: 5,
            ),
            Text(
              price,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
