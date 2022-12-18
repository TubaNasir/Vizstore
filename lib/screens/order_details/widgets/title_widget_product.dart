import 'package:flutter/material.dart';

class TitleWidgetProduct extends StatelessWidget {
  const TitleWidgetProduct(
      {Key? key, required this.cardTitle, required this.cardSubtitle})
      : super(key: key);
  final String cardTitle, cardSubtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                cardSubtitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}