import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/screens/wishlist/widgets/wishlist_card.dart';
import 'package:provider/provider.dart';
import '../../controllers/wishlist_provider.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/layout.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
      await context.read<WishlistProvider>().getUser(),
      await context.read<WishlistProvider>().getProductsList(),
      await context.read<WishlistProvider>().getStoresList()
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<WishlistProvider>().user;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Wishlist",
          backButton: false,
        ),
        body: Stack(
          children: [
            Layout(
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children:
                          user.wishlist
                              .map((e) => WishListCard(
                            wishlistItem: e,
                          ))
                              .toList(),
                      ),
                      SizedBox(height: 100,),
                    ],
                  ),
                )),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}





