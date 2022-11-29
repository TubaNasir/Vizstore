import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/product_provider.dart';
import 'package:flutterdemo/controllers/user_provider.dart';
import 'package:flutterdemo/controllers/store_provider.dart';
import 'package:flutterdemo/models/store_model.dart';
import 'package:flutterdemo/repositories/store_repository.dart';
import 'package:flutterdemo/screens/themes.dart';
import 'package:flutterdemo/screens/widgets/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login/login.dart';

final getIt = GetIt.instance;


Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getIt.registerSingleton<StoreRepository>(StoreRepository());


  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras[1];
  
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NavBar()),
            ChangeNotifierProvider(create: (_) => UserProvider()),
            ChangeNotifierProvider(create: (_) => ProductProvider()),
            ChangeNotifierProvider(create: (_) => StoreProvider(getIt()))
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





