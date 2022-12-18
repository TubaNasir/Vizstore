import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/notifications/notifications.dart';
import 'package:provider/provider.dart';
import '../../../controllers/home_provider.dart';

class NotificationIcon extends StatefulWidget {
  NotificationIcon({Key? key}) : super(key: key);

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('user').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            int filteredList = context.read<HomeProvider>().notifications(snapshot);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                                builder: (context) => Notifications()),
                          )
                          .then((value) =>
                              context.read<HomeProvider>().markAsRead());
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
                  if (filteredList != 0)
                    Positioned(
                      top: -2,
                      right: 0,
                      child: Container(
                        height: 24,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            filteredList.toString(),
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
        });
  }
}
