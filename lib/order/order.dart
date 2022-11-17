import 'package:flutter/material.dart';
import '../../widgets/horizontal_card.dart';
import '../constants.dart';
import '../widgets/customAppBar.dart';
import 'order_details.dart';
import 'order_model.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Orders',
        backButton: true,
      ),
      body: ListView(
          children: demoOrders
              .map((e) => OrderCard(
            productImage: e.products.first.image,
            title: "Order ID: ${e.id}",
            placedOn: e.placedOn.toString(),
            status: e.status,
            icon: Icon(
              Icons.chevron_right,
              color: PrimaryColor,
            ),
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderDetails(
                    order: e,
                  ),
                ),
              );
            },
          ),)
              .toList()),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key, required this.productImage, required this.title, required this.placedOn, required this.status, required this.icon, required this.press}) : super(key: key);

  final String productImage;
  final String title, placedOn, status;
  final Widget icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageWidget(productImage: productImage),
            const SizedBox(
              width: 20,
            ),
            TitleWidget(title: title, status: status, placedOn: placedOn),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: icon,
            )
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
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
                Text(status, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: status == 'Confirmed' ? Colors.green : status == 'Cancelled' ? Colors.red : Color(0xFF424242)),
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

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.productImage,
  }) : super(key: key);

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      child: AspectRatio(
        aspectRatio: 1.11,
        child: Container(
          //width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: SecondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: Image.network(productImage)),
      ),
    );
  }
}
