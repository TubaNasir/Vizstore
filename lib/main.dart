import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/camera_provider.dart';
import 'package:flutterdemo/controllers/cart_provider.dart';
import 'package:flutterdemo/controllers/checkout_provider.dart';
import 'package:flutterdemo/controllers/complete_profile_provider.dart';
import 'package:flutterdemo/controllers/edit_profile_provider.dart';
import 'package:flutterdemo/controllers/login_provider.dart';
import 'package:flutterdemo/controllers/my_orders_provider.dart';
import 'package:flutterdemo/controllers/notifications_provider.dart';
import 'package:flutterdemo/controllers/order_details_provider.dart';
import 'package:flutterdemo/controllers/product_details_provider.dart';
import 'package:flutterdemo/controllers/my_profile_provider.dart';
import 'package:flutterdemo/controllers/search_provider.dart';
import 'package:flutterdemo/controllers/signup_provider.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/controllers/store_provider.dart';
import 'package:flutterdemo/controllers/wishlist_provider.dart';
import 'package:flutterdemo/repositories/firebase_order_repository.dart';
import 'package:flutterdemo/repositories/firebase_user_repository.dart';
import 'package:flutterdemo/repositories/firebase_product_repository.dart';
import 'package:flutterdemo/repositories/firebase_store_repository.dart';
import 'package:flutterdemo/screens/themes.dart';
import 'package:flutterdemo/controllers/bottom_nav_bar_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'domain/user_repository.dart';
import 'screens/widgets/splash_screen.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getIt.registerSingleton<FirebaseStoreRepository>(FirebaseStoreRepository(),
      instanceName: 'store');
  getIt.registerSingleton<FirebaseProductRepository>(FirebaseProductRepository(),
      instanceName: 'product');
  getIt.registerSingleton<UserRepository>(FirebaseUserRepository(),
      instanceName: 'user');
  getIt.registerSingleton<FirebaseOrderRepository>(FirebaseOrderRepository(),
      instanceName: 'order');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NavBar()),
      ChangeNotifierProvider(
          create: (_) => LoginProvider(getIt.get(instanceName: 'user'))),
      ChangeNotifierProvider(
          create: (_) => SignupProvider(getIt.get(instanceName: 'user'))),
      ChangeNotifierProvider(
          create: (_) =>
              CompleteProfileProvider(getIt.get(instanceName: 'user'))),
      ChangeNotifierProvider(
          create: (_) => MyProfileProvider(getIt.get(instanceName: 'user'))),
      ChangeNotifierProvider(
          create: (_) => HomeProvider(getIt.get(instanceName: 'product'),
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
      ChangeNotifierProvider(
          create: (_) => CameraProvider(
                getIt.get(instanceName: 'product'),
              )),
      ChangeNotifierProvider(
          create: (_) => StoreProvider(
                getIt.get(instanceName: 'product'),
                getIt.get(instanceName: 'user'),
              )),
      ChangeNotifierProvider(
          create: (_) => OrderDetailsProvider(
                getIt.get(instanceName: 'product'),
                getIt.get(instanceName: 'user'),
            getIt.get(instanceName: 'store'),
              )),
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
