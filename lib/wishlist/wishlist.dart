import 'package:camera/camera.dart';
import 'package:flutterdemo/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/wishlist/widgets/wishlist_body.dart';
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
        appBar: const CustomAppBar(
          title: "Wishlist",
          backButton: false,
        ),
        body: Stack(
          children: [
            Layout(
                widget: WishlistBody(camera: camera,)),
            BottomNavBar(camera: camera,),
          ],
        ),
      ),
    );
  }
}





