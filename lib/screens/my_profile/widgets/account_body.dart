import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/my_profile/widgets/profile_menu.dart';
import 'package:flutterdemo/screens/my_profile/widgets/profile_pic.dart';
import '../../constants.dart';
import '../../login/login.dart';
import '../../order/order.dart';
import '../../edit_profile/edit_profile.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProfilePic(),
        SizedBox(
          height: 20,
        ),
        ProfileMenu(
            icon: Icon(Icons.person, color: PrimaryColor),
            text: "My Profile",
            iconRight: const Icon(Icons.chevron_right, color: PrimaryColor,),
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditProfile(),
                ),
              );
            }
        ),
        ProfileMenu(
            icon: Icon(Icons.square_rounded, color: PrimaryColor),
            text: "My Orders",
            iconRight: Icon(Icons.chevron_right, color: PrimaryColor),
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyOrders(),
                ),
              );
            }
        ),
        ProfileMenu(
            icon: Icon(Icons.logout, color: PrimaryColor),
            text: "Log Out",
            iconRight: Icon(Icons.chevron_right, color: PrimaryColor),  //HAVE TO IMPLEMENT TOGGLE FUNCTIONALITY LATER
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Login(camera: camera,),
                ),
              );
            }
        ),
        SizedBox(height: 100,)
      ],
    );
  }
}