import 'package:flutter/material.dart';

import '../notification_model.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
