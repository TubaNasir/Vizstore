import 'package:flutter/material.dart';

class TitleWidgetOrder extends StatelessWidget {
  const TitleWidgetOrder({
    Key? key,
    required this.title,
    required this.status,
    required this.placedOn,
  }) : super(key: key);

  final String title;
  final String status;
  final String placedOn;

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
              //mainAxisSize: MainAxisSize.min,
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
                Text(status, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: status == 'confirmed' ? Colors.green : status == 'cancelled' ? Colors.red : Color(0xFF424242)),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              placedOn,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}