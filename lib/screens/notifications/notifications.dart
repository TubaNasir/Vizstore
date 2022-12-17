import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/notifications_provider.dart';
import 'package:flutterdemo/models/notification_json.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_app_bar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
          await context.read<NotificationsProvider>().getUser(),
          context.read<NotificationsProvider>().getSortedNotifications(),
        });
  }

  @override
  Widget build(BuildContext context) {
    List<NotificationItemJson> notifications =
        context.watch<NotificationsProvider>().notifications;

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
                  itemCount: notifications.length,
                  itemBuilder: (context, index) => Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 5.0),
                        child: ListTile(
                          dense: true,
                          visualDensity: VisualDensity(vertical: 3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: Color(0xFFF5F6F9),
                          leading: Icon(Icons.person),
                          //store logo?
                          title: Text(notifications[index].message,
                              style: notifications[index].read
                                  ? null
                                  : TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Text(
                            "${notifications[index].dateTime.day}/${notifications[index].dateTime.month} | ${notifications[index].dateTime.hour}:${notifications[index].dateTime.minute}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      )))),
    );
  }
}
