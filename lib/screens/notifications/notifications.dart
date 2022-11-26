import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/notifications/widgets/notification_body.dart';

import '../widgets/custom_app_bar/custom_app_bar.dart';

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
          body: NotificationBody()
      ),
    );
  }
}
