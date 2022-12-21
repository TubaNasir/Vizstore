import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/controllers/my_profile_provider.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/edit_profile/edit_profile.dart';
import 'package:flutterdemo/screens/login/login.dart';
import 'package:flutterdemo/screens/my_orders/my_orders.dart';
import 'package:flutterdemo/screens/my_profile/widgets/profile_menu.dart';
import 'package:flutterdemo/controllers/bottom_nav_bar_provider.dart';
import 'package:flutterdemo/screens/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ProfileMenu(
          icon: Icon(Icons.person, color: PrimaryColor),
          text: "My Profile",
          iconRight: const Icon(
            Icons.chevron_right,
            color: PrimaryColor,
          ),
          press: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditProfile(),
              ),
            );
          }),
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
          }),
      ProfileMenu(
          icon: Icon(Icons.logout, color: PrimaryColor),
          text: "Log Out",
          iconRight: Icon(Icons.chevron_right, color: PrimaryColor),
          press: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Text('Are you sure you want to logout?', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 100,
                              child: CustomButton(
                                pressed: () async => {
                                  await context.read<MyProfileProvider>().cancelSubscription(),
                                  context.read<MyProfileProvider>().logout(),
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  ),
                                  context.read<NavBar>().setPage('home'),
                                },
                                text: 'Yes',
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 100,
                              child: CustomButton(
                                pressed: () => Navigator.pop(context),
                                text: 'No',
                              ),
                            ),
                          ],
                        ),
                      ]);
                });
          }),
    ]);
  }
}
