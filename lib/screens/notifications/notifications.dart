import 'package:flutter/material.dart';

import '../widgets/custom_app_bar/custom_app_bar.dart';
import 'notification_model.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            title: "Notifications",
            backButton: true,
          ),
          body: SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 5.0),
                    child: ListTile(
                      dense: true,
                      visualDensity: VisualDensity(vertical: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: Color(0xFFF5F6F9),
                      leading: Icon(Icons.person),
                      //store logo?
                      title: Text(notificationList[index].title),
                      trailing: Text(
                        "${notificationList[index].time.hour}:${notificationList[index].time.minute}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  )
              )
          )
      ),
    );
  }
}
