import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/notifications/notification_model.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title, required this.backButton})
      : super(key: key);

  final String title;
  final bool backButton;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _CustomAppBarState extends State<CustomAppBar> {
  int numOfitem = notificationList.length;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                  height: 70.0,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30.0)),
                    gradient: PrimaryGradientColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.backButton
                            ? InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                              )
                            : SizedBox(width: 30),
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: const BoxDecoration(
                  gradient: PrimaryGradientColor,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
}
