import 'package:camera/camera.dart';
import 'package:flutterdemo/home/home_model.dart';
import 'package:flutterdemo/search/search.dart';
import 'package:flutterdemo/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class StoreMain extends StatelessWidget {
  const StoreMain({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Store Name",
        backButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
        child: Column(
          children: [
            SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Products(demoList: demoProducts, camera: camera,)),
            const SizedBox(height: 100),

          ],
        ),
      ),
    );
  }
}
