import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/models/user_model.dart';
import 'package:flutterdemo/screens/home/widgets/catgories.dart';
import 'package:flutterdemo/screens/home/widgets/heading.dart';
import 'package:flutterdemo/screens/home/widgets/popular_products.dart';
import 'package:flutterdemo/screens/home/widgets/promotion.dart';
import '../../models/product_model.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/layout.dart';
import '../widgets/search_bar.dart';
import '../widgets/staggered_products.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final CameraDescription camera;

  const Home({required this.camera, super.key});

  @override
  State<Home> createState() => _HomeState(this.camera);
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          context.read<HomeProvider>().getProductsList(),
          context.read<HomeProvider>().getUser()
        });
  }

  final CameraDescription camera;

  _HomeState(this.camera);

  @override
  Widget build(BuildContext context) {
    List<Product> products = context.watch<HomeProvider>().products;
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
                    Text(user.email.toString()),
                    SearchBar(camera: camera),
                    const SizedBox(height: 20),
                    const Promotion(),
                    const SizedBox(height: 20),
                    const Heading(text: 'Categories'),
                    const SizedBox(height: 10),
                    Categories(camera: camera),
                    const SizedBox(height: 20),
                    const Heading(text: "Popular Products"),
                    const SizedBox(height: 10),
                    PopularProducts(
                      camera: camera,
                    ),
                    const SizedBox(height: 20),
                    const Heading(text: "New Arrivals"),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      child: StaggeredProductView(
                        demoList: products,
                        camera: camera,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            BottomNavBar(
              camera: camera,
            ),
          ],
        ),
      ),
    );
  }
}
