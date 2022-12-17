import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/my_profile/widgets/menu_list.dart';
import 'package:flutterdemo/screens/my_profile/widgets/profile_pic.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/layout.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
              widget: ListView(
                children: [
                  //ProfilePic(),
                  SizedBox(height: 20,),
                  MenuList(),
                  SizedBox(height: 100,)
                ],
              ),
            ),
            //AccountBody(),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}
