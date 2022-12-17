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
                Container(
                  decoration: BoxDecoration(
                    color: status == 'Confirmed' ? Colors.lightGreen[300] : status == 'Cancelled' ? Colors.red[400] : Colors.yellow[300],
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(status, style: Theme.of(context).textTheme.bodyMedium),
                  ),
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