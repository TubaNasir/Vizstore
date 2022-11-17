import 'package:camera/camera.dart';
import 'package:flutterdemo/camera/camera.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/my_profile/my_profile.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar_provider.dart';
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
                    icon: Icon(
                      Icons.home,
                      color: context.watch<NavBar>().page.toString() == 'home'
                          ? Colors.black
                          : Colors.grey,
                    ),
                    onPressed: () {
                      context.read<NavBar>().setPage('home');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(camera: camera),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: context.watch<NavBar>().page.toString() == 'cart'
                          ? Colors.black
                          : Colors.grey,
                    ),
                    onPressed: () {
                      context.read<NavBar>().setPage('cart');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Cart(camera: camera,),
                        ),
                      );
                    },
                  ),
                  Container(width: size.width * 0.20),
                  IconButton(
                    icon: Icon(Icons.favorite,
                      color: context.watch<NavBar>().page.toString() == 'fav'
                          ? Colors.black
                          : Colors.grey,),
                    onPressed: () {
                      context.read<NavBar>().setPage('fav');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Wishlist(camera: camera,),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person_outline_outlined,
                      color: context.watch<NavBar>().page.toString() == 'profile'
                          ? Colors.black
                          : Colors.grey),
                    onPressed: () {
                      context.read<NavBar>().setPage('profile');
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

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 10, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
