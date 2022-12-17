import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/controllers/login_provider.dart';
import 'package:flutterdemo/models/user_model.dart';
import 'package:flutterdemo/screens/home/widgets/catgories.dart';
import 'package:flutterdemo/screens/home/widgets/heading.dart';
import 'package:flutterdemo/screens/home/widgets/notification_icon.dart';
import 'package:flutterdemo/screens/home/widgets/popular_products.dart';
import 'package:flutterdemo/screens/home/widgets/promotion.dart';
import 'package:flutterdemo/screens/home/widgets/staggered_product_view.dart';
import '../../models/product_model.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/layout.dart';
import '../widgets/search_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

   Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
          await context.read<HomeProvider>().getProductsList(),
          await context.read<HomeProvider>().getUser(),
          context.read<HomeProvider>().sendNotifications(),
          await context.read<HomeProvider>().getPopularProducts()
    });
  }


  @override
  Widget build(BuildContext context) {

    List<ProductJson> products = context.watch<HomeProvider>().products;
    UserJson user = context.watch<HomeProvider>().user;
    print('home '+user.email.toString());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(title: 'VizStore', backButton: false),
        body: Stack(
          children: [
            Layout(
              widget: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(child: SearchBar()),
                        NotificationIcon(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Promotion(),
                    const SizedBox(height: 20),
                    const Heading(text: 'Categories'),
                    const SizedBox(height: 10),
                    Categories(),
                    const SizedBox(height: 20),
                    const Heading(text: "Popular Products"),
                    const SizedBox(height: 10),
                    PopularProducts(),
                    const SizedBox(height: 20),
                    const Heading(text: "All Products"),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      child: StaggeredProductView(
                        products: products,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}
