import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/notifications/notification_model.dart';
import 'package:flutterdemo/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Notifications",
          backButton: true,
        ),
        body: SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
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
                        style: Theme.of(context).textTheme.bodySmall,),
                      ),
                    ))));
  }
}
