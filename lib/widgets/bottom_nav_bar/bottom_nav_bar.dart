import 'package:camera/camera.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutterdemo/camera/camera.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/my_profile/my_profile.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/widgets/camera.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/widgets/my_custom_painter.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/widgets/nav_bar_icon.dart';
import 'package:flutterdemo/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/home/home.dart';
import 'package:flutterdemo/cart/cart.dart';
import 'package:provider/provider.dart';

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
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => CameraScreen(camera:camera))
                    );
                  },
                  backgroundColor: PrimaryColor,
                  child: Icon(Icons.camera_alt_outlined, color: Colors.white,),
                  elevation: 0.1),
            ),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: GlowIcon(
                      Icons.home,
                      color: context.watch<NavBar>().page.toString() == navBarPages[0] ? Colors.black : Colors.grey,
                      glowColor: context.watch<NavBar>().page.toString() == navBarPages[0] ? Colors.grey : Colors.transparent,
                      blurRadius: 9,
                      size: 30,
                    ),
                    onPressed: () {
                      context.read<NavBar>().setPage(navBarPages[0]);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(camera: camera),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: GlowIcon(
                      Icons.shopping_cart,
                      color: context.watch<NavBar>().page.toString() == navBarPages[1] ? Colors.black : Colors.grey,
                      glowColor: context.watch<NavBar>().page.toString() == navBarPages[1] ? Colors.grey : Colors.transparent,
                      blurRadius: 9,
                      size: 30,
                    ),
                    onPressed: () {
                      context.read<NavBar>().setPage(navBarPages[1]);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Cart(camera: camera,),
                        ),
                      );
                    },
                  ),
                  Container(width: size.width * 0.20),
                  IconButton(
                    icon: GlowIcon(
                      Icons.favorite,
                      color: context.watch<NavBar>().page.toString() == navBarPages[2] ? Colors.black : Colors.grey,
                      glowColor: context.watch<NavBar>().page.toString() == navBarPages[2] ? Colors.grey : Colors.transparent,
                      blurRadius: 9,
                      size: 30,
                    ),
                    onPressed: () {
                      context.read<NavBar>().setPage(navBarPages[2]);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Wishlist(camera: camera,),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: GlowIcon(
                      Icons.person,
                      color: context.watch<NavBar>().page.toString() == navBarPages[3] ? Colors.black : Colors.grey,
                      glowColor: context.watch<NavBar>().page.toString() == navBarPages[3] ? Colors.grey : Colors.transparent,
                      blurRadius: 9,
                      size: 30,
                    ),
                    onPressed: () {
                      context.read<NavBar>().setPage(navBarPages[3]);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyProfile(camera: camera,),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
