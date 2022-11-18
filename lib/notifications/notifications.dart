import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/notifications/notification_model.dart';
import 'package:flutterdemo/widgets/custom_app_bar/custom_app_bar.dart';
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
        body: NotificationBody()
    );
  }
}
