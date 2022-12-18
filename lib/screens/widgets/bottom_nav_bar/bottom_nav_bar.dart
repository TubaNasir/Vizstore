import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutterdemo/controllers/bottom_nav_bar_provider.dart';
import 'package:flutterdemo/screens/camera/choice.dart';
import 'package:flutterdemo/screens/cart/cart.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/home/home.dart';
import 'package:flutterdemo/screens/my_profile/my_profile.dart';
import 'package:flutterdemo/screens/widgets/bottom_nav_bar/widgets/my_custom_painter.dart';
import 'package:flutterdemo/screens/wishlist/wishlist.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
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
                  onPressed: () async {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ChoiceScreen())
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
                      size: 24,
                    ),
                    onPressed: () {
                      context.read<NavBar>().setPage(navBarPages[0]);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Home(),
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
                      size: 24,
                    ),
                    onPressed: () {
                      context.read<NavBar>().setPage(navBarPages[1]);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Cart(),
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
                      size: 24,
                    ),
                    onPressed: () {
                      context.read<NavBar>().setPage(navBarPages[2]);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Wishlist(),
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
                      size: 24,
                    ),
                    onPressed: () {
                      context.read<NavBar>().setPage(navBarPages[3]);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyProfile(),
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
