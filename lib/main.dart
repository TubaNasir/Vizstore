import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/camera_provider.dart';
import 'package:flutterdemo/controllers/cart_provider.dart';
import 'package:flutterdemo/controllers/checkout_provider.dart';
import 'package:flutterdemo/controllers/complete_profile_provider.dart';
import 'package:flutterdemo/controllers/edit_profile_provider.dart';
import 'package:flutterdemo/controllers/login_provider.dart';
import 'package:flutterdemo/controllers/my_orders_provider.dart';
import 'package:flutterdemo/controllers/notifications_provider.dart';
import 'package:flutterdemo/controllers/product_details_provider.dart';
import 'package:flutterdemo/controllers/profile_provider.dart';
import 'package:flutterdemo/controllers/search_provider.dart';
import 'package:flutterdemo/controllers/signup_provider.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/controllers/store_provider.dart';
import 'package:flutterdemo/controllers/wishlist_provider.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/store_model.dart';
import 'package:flutterdemo/repositories/order_repository.dart';
import 'package:flutterdemo/repositories/product_repository.dart';
import 'package:flutterdemo/repositories/store_repository.dart';
import 'package:flutterdemo/screens/themes.dart';
import 'package:flutterdemo/screens/widgets/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/camera_provider.dart';
import 'screens/login/login.dart';
import 'screens/widgets/splash_screen.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getIt.registerSingleton<StoreRepository>(StoreRepository(),
      instanceName: 'store');
  getIt.registerSingleton<ProductRepository>(ProductRepository(),
      instanceName: 'product');
  getIt.registerSingleton<UserRepository>(UserRepository(),
      instanceName: 'user');
  getIt.registerSingleton<OrderRepository>(OrderRepository(),
      instanceName: 'order');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NavBar()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => SignupProvider(getIt.get(instanceName: 'user'))),
      ChangeNotifierProvider(create: (_) => CompleteProfileProvider(getIt.get(instanceName: 'user'))),
      ChangeNotifierProvider(create: (_) => ProfileProvider(getIt.get(instanceName: 'user'))),
      ChangeNotifierProvider(
          create: (_) => HomeProvider(
              getIt.get(instanceName: 'store'),
              getIt.get(instanceName: 'product'),
              getIt.get(instanceName: 'user'))),
      ChangeNotifierProvider(
          create: (_) => CartProvider(
              getIt.get(instanceName: 'store'),
              getIt.get(instanceName: 'product'),
              getIt.get(instanceName: 'user'))),
      ChangeNotifierProvider(
          create: (_) => ProductDetailsProvider(
              getIt.get(instanceName: 'store'),
              getIt.get(instanceName: 'user'))),
      ChangeNotifierProvider(
          create: (_) => SearchProvider(
                getIt.get(instanceName: 'product'),
                getIt.get(instanceName: 'user'),
              )),
      ChangeNotifierProvider(
          create: (_) => CheckoutProvider(
              getIt.get(
                instanceName: 'user',
              ),
              getIt.get(instanceName: 'store'),
              getIt.get(instanceName: 'product'),
              getIt.get(instanceName: 'order'))),
      ChangeNotifierProvider(
          create: (_) => NotificationsProvider(
                getIt.get(instanceName: 'user'),
                getIt.get(instanceName: 'store'),
              )),
      ChangeNotifierProvider(
          create: (_) => MyOrdersProvider(
              getIt.get(instanceName: 'user'),
              getIt.get(instanceName: 'order'),
              getIt.get(instanceName: 'product'))),
      ChangeNotifierProvider(
          create: (_) => WishlistProvider(
                getIt.get(instanceName: 'store'),
                getIt.get(instanceName: 'product'),
                getIt.get(instanceName: 'user'),
              )),
      ChangeNotifierProvider(
          create: (_) => EditProfileProvider(
                getIt.get(instanceName: 'user'),
              )),
      ChangeNotifierProvider(create: (_) => CameraProvider(getIt.get(instanceName: 'product'),
      )),
      ChangeNotifierProvider(create: (_) => StoreProvider(getIt.get(instanceName: 'product'),)),
    ],
    child: MyApp(),
    //create: (_) => NavBar(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: Login(),
      home: const SplashScreen(),
    );
  }
}
