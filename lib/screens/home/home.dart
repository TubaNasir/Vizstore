import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/screens/home/widgets/catgories.dart';
import 'package:flutterdemo/screens/home/widgets/heading.dart';
import 'package:flutterdemo/screens/home/widgets/notification_icon.dart';
import 'package:flutterdemo/screens/home/widgets/popular_products.dart';
import 'package:flutterdemo/screens/home/widgets/promotion.dart';
import 'package:flutterdemo/screens/home/widgets/staggered_product_view.dart';
import 'package:flutterdemo/screens/widgets/custom_app_bar.dart';
import 'package:flutterdemo/screens/widgets/home_app_bar.dart';
import 'package:flutterdemo/screens/widgets/layout.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'widgets/search_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
          context.read<HomeProvider>().setIsFetchingTrue(),
          await context.read<HomeProvider>().getProductsList(),
          await context.read<HomeProvider>().getUser(),
          await context.read<HomeProvider>().getPopularProducts(),
          context.read<HomeProvider>().setIsFetchingFalse(),
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const HomeAppBar(),
        body: Stack(
          children: [
            context.watch<HomeProvider>().isFetching
                ? Center(child: CircularProgressIndicator())
                : Layout(
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
                              products: context.watch<HomeProvider>().products,
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
