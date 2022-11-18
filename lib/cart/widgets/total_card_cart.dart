import 'package:flutter/material.dart';

import '../../constants.dart';

class TotalCardCart extends StatelessWidget {
  const TotalCardCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Rs 2700',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}


