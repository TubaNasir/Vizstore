import 'package:camera/camera.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/my_profile/my_profile.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/widgets/camera.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/widgets/my_custom_painter.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/widgets/nav_bar_icon.dart';
import 'package:flutterdemo/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/home/home.dart';
import 'package:flutterdemo/cart/cart.dart';

class BottomNavBar extends StatelessWidget {
  final CameraDescription camera;
  const BottomNavBar({required this.camera, super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: MyCustomPainter(),
            ),
            Camera(camera: camera),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavBarIcon(
                      icon: Icons.home,
                      selectedIcon: navBarPages[0],
                      camera: camera,
                      onPress: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Home(camera: camera),
                          ),
                        );
                      }),
                  NavBarIcon(
                      icon: Icons.shopping_cart,
                      selectedIcon: navBarPages[1],
                      camera: camera,
                      onPress: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Cart(camera: camera),
                          ),
                        );
                      }),
                  NavBarIcon(
                      icon: Icons.favorite,
                      selectedIcon: navBarPages[2],
                      camera: camera,
                      onPress: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Wishlist(camera: camera),
                          ),
                        );
                      }),
                  NavBarIcon(
                      icon: Icons.person,
                      selectedIcon: navBarPages[3],
                      camera: camera,
                      onPress: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyProfile(camera: camera),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
