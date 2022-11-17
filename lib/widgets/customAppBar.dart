import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifications/notifications.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const CustomAppBar({Key? key, required this.title, required this.backButton})
      : super(key: key);

  final String title;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    int numOfitem = 5;

    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.0)),
                    gradient: PrimaryGradientColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        backButton ? InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ) : SizedBox(width: 30),
                        Text(
                          title,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        (context
                            .watch<NavBar>()
                            .page
                            .toString() == 'home') ? InkWell(
                          borderRadius: BorderRadius.circular(100),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: SecondaryColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                    Icons.notifications_active_outlined),
                                    
                              ),
                              if (numOfitem != 0)
                                Positioned(
                                  top: -3,
                                  right: 0,
                                  child: Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                      //border: Border.all(width: 1.5, color: Colors.white),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "$numOfitem",
                                        style: TextStyle(
                                          fontSize: 10,
                                          height: 1,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ) :
                        SizedBox(width: 30),
                      ],
                    ),

                  )
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 30,
                decoration: const BoxDecoration(
                  gradient: PrimaryGradientColor,
                ),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(30.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(130);

}