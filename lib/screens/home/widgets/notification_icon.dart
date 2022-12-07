import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/notifications/notifications.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numOfitem = 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        //clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(4.0),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: SecondaryColor.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.notifications_active_outlined),
            ),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  //border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: const TextStyle(
                      fontSize: 10,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
