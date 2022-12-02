import 'package:camera/camera.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';

import '../camera/camera.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: SecondaryColor, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: [
          const Expanded(
            child:
              TextField(
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Search Product',
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(horizontal: 90, vertical: 9)),
              ),
          ),
          IconButton(
            onPressed: () async {
              // Obtain a list of the available cameras on the device.
              final cameras = await availableCameras();
              // Get a specific camera from the list of available cameras.
              final firstCamera = cameras[0];
              Navigator.of(context).push(
                MaterialPageRoute(builder:(context) => CameraScreen(camera: firstCamera))
              );
            }, 
            icon: Icon(Icons.camera_alt,color: Colors.black,)
          )
        ],
      ),
    );
  }
}
