import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/profile_provider.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/edit_profile/edit_profile.dart';
import 'package:flutterdemo/screens/login/login.dart';
import 'package:flutterdemo/screens/my_profile/widgets/profile_menu.dart';
import 'package:flutterdemo/screens/order/my_orders.dart';
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
          //HAVE TO IMPLEMENT TOGGLE FUNCTIONALITY LATER
          press: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Text('Are you sure you want to logout?'),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CustomButton(
                                pressed: () => {
                                  context.read<ProfileProvider>().logout(),
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  ),
                                },
                                text: 'Yes',
                              ),
                            ),
                            Expanded(
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
