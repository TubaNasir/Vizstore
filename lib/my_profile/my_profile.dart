import 'package:camera/camera.dart';
import 'package:flutterdemo/my_profile/edit_profile.dart';
import 'package:flutterdemo/order/order.dart';
import 'package:flutterdemo/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../widgets/layout.dart';
import '../constants.dart';

class MyProfile extends StatefulWidget {
  final CameraDescription camera;
  const MyProfile({required this.camera,super.key});

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
          title: 'My Profile', backButton: false,
        ),
        body: Stack(
          children: [
            Layout(widget: AccountBody()),
            //AccountBody(),
            BottomNavBar(camera: camera,),
          ],
        ),
      ),
    );
  }
}


class AccountBody extends StatelessWidget {
  const AccountBody({Key? key}) : super(key: key);

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
            press: () {}
        ),
        SizedBox(height: 100,)
      ],
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 115,
        width: 115,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://i1.pickpik.com/photos/528/587/667/bloom-blossom-blur-close-up-preview.jpg'),
        ),
      ),
    );
  }
}


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    required this.iconRight,
  }) : super(key: key);

  final String text;
  final Icon icon, iconRight;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF5F6F9),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              iconRight
            ],
          ),
        ),
      ),
    );
  }
}
