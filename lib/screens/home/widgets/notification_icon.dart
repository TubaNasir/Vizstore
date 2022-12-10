import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/models/user_model.dart';
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
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
    {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text("Loading");
      }

    //print(snapshot.data?.docs);
     // UserJson newUser =
     //      UserJson.fromJson(snapshot.data as Map<String, dynamic>, event.id);
      else {

        int filteredList = context.read<HomeProvider>().notifications(snapshot);
        //print(newUser.id);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            //clipBehavior: Clip.none,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Notifications()),
                  ).then((value) => context.read<HomeProvider>().markAsRead());
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
                  top: -3,
                  right: 0,
                  child: Container(
                    height: 16,
                    width: 16,
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
    }
    );
  }
}
