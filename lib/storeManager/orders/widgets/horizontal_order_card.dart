import 'package:flutter/material.dart';


class HorizontalOrderCard extends StatelessWidget {
  HorizontalOrderCard({
    Key? key,
    required this.productImage,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.icon, required this.press,
  }) : super(key: key);

  final String productImage;
  final String cardTitle, cardSubtitle;
  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF5F6F9),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: PrimaryLightColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.network(productImage),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      cardSubtitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
            ),
            icon
          ],
        ),
      ),
    );
  }
}

