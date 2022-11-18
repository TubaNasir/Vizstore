import 'package:camera/camera.dart';
import 'package:flutterdemo/camera/camera.dart';
import 'package:flutterdemo/cart/cart.dart';
import 'package:flutterdemo/checkout/checkout.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/home/home.dart';
import 'package:flutterdemo/order/order_details.dart';
import 'package:flutterdemo/order/order_model.dart';
import 'package:flutterdemo/search/search.dart';
import 'package:flutterdemo/signup/signup.dart';
import 'package:flutterdemo/store/store_main.dart';
import 'package:flutterdemo/storeManager/orders/order_detail_store.dart';
import 'package:flutterdemo/storeManager/orders/orders.dart';
import 'package:flutterdemo/storeManager/product/add_product.dart';
import 'package:flutterdemo/storeManager/product/edit_product.dart';
import 'package:flutterdemo/storeManager/store_home/store_home.dart';
import 'package:flutterdemo/storeManager/widgets/bottom_nav_bar_store/bottom_nav_bar_store_model.dart';
import 'package:flutterdemo/success/success.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterdemo/themes.dart';

import 'login/login.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras[1];
  
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NavBar()),
            ChangeNotifierProvider(create: (_) => NavBarStore())
          ],
    child: MyApp(camera: firstCamera),
    //create: (_) => NavBar(),
  ));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  const MyApp({Key? key, required this.camera}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: Login(camera: camera,),
    );
  }
}





