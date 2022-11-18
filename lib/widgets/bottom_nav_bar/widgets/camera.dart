import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/camera/camera.dart';
import 'package:flutterdemo/constants.dart';

class Camera extends StatelessWidget {
  const Camera({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 0.6,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CameraScreen(camera: camera))
          );
        },
        backgroundColor: PrimaryColor,
        child: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
        elevation: 0.1,
      ),
    );
  }
}