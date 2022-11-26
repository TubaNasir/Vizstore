import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bottom_nav_bar_provider.dart';

class NavBarIcon extends StatefulWidget {
  const NavBarIcon({Key? key, required this.icon, required this.selectedIcon, required this.camera, required this.onPress}) : super(key: key);

  final IconData icon;
  final String selectedIcon;
  final CameraDescription camera;
  final VoidCallback onPress;

  @override
  State<NavBarIcon> createState() => _NavBarIconState();
}

class _NavBarIconState extends State<NavBarIcon> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.icon,
        color: context.watch<NavBar>().page.toString() == widget.selectedIcon
            ? Colors.black
            : Colors.grey,
      ),
      onPressed: () {
        context.read<NavBar>().setPage(widget.selectedIcon);
        widget.onPress;
        print(widget.selectedIcon.toString());
      },
    );
  }
}
