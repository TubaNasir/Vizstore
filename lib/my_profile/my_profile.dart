import 'package:camera/camera.dart';
import 'package:flutterdemo/my_profile/widgets/account_body.dart';
import 'package:flutterdemo/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/layout.dart';
import '../constants.dart';

class MyProfile extends StatefulWidget {
  final CameraDescription camera;

  const MyProfile({required this.camera, super.key});

  @override
  State<MyProfile> createState() => _MyProfileState(camera);
}

class _MyProfileState extends State<MyProfile> {
  final CameraDescription camera;

  _MyProfileState(this.camera);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'My Profile',
          backButton: false,
        ),
        body: Stack(
          children: [
            Layout(
              widget: AccountBody(camera: camera,),
            ),
            //AccountBody(),
            BottomNavBar(
              camera: camera,
            ),
          ],
        ),
      ),
    );
  }
}
