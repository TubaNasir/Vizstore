import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/notifications/notification_model.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key})
      : super(key: key);


  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _HomeAppBarState extends State<HomeAppBar> {

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
              Stack(
                children: [
                  Container(
                    height: 70.0,
                    color: Color(0xFDFDFDFF),
                  ),
                  Container(
                      height: 70.0,
                      //color: Color(0xFDFDFDFF),
                      decoration: BoxDecoration(
                        //color: Color(0xFDFDFDFF),
                        borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30.0)),
                        gradient: PrimaryGradientColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset("assets/images/VizStoreLogo.png")
                        ),
                      )),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: const BoxDecoration(
                  gradient: PrimaryGradientColor,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFDFDFDFF),
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
