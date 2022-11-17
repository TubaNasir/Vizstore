import 'package:camera/camera.dart';
import 'package:flutterdemo/home/home.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyIconButton extends StatelessWidget {
  final CameraDescription camera;
  const MyIconButton({required this.camera,super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
            builder: (context) => Home(camera: camera,),
          ),
        );
      },
    );
  }
}
