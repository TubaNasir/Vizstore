import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/store/store_main.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StoreMain(
                camera: camera,
              ),
            ),
          );
        },
        child: Text(
          'By Clothing Brand',
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
