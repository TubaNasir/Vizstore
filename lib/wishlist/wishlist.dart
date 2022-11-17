import 'package:camera/camera.dart';
import 'package:flutterdemo/widgets/customAppBar.dart';
import 'package:flutterdemo/widgets/horizontal_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../home/home_model.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/layout.dart';

class Wishlist extends StatefulWidget {
  final CameraDescription camera;
  const Wishlist({required this.camera,super.key});

  @override
  State<Wishlist> createState() => _WishlistState(camera);
}

bool fav = true;

class _WishlistState extends State<Wishlist> {
  final CameraDescription camera;
  _WishlistState(this.camera);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Wishlist",
          backButton: false,
        ),
        body: Stack(
          children: [
            Layout(
                widget: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: demoProducts
                        .map((e) => WishListCard(
                              productImage: e.image,
                              title: e.title,
                              price: "Rs. " + e.price.toString(),
                              icon: Icon(
                                Icons.favorite,
                                color: (fav == true ? Colors.red : Colors.grey),
                                size: 20,
                              ),
                              press: () {}, storeName: 'lala',
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            )),
            BottomNavBar(camera: camera,),
          ],
        ),
      ),
    );
  }
}

class WishListCard extends StatelessWidget {
  const WishListCard(
      {Key? key,
      required this.productImage,
      required this.title,
      required this.price,
      required this.icon,
      required this.press, required this.storeName})
      : super(key: key);

  final String productImage;
  final String title, price, storeName;
  final Widget icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            elevation: 5,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
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
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
