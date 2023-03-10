import 'package:flutter/material.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/screens/wishlist/widgets/wishlist_card.dart';
import 'package:provider/provider.dart';
import '../../controllers/wishlist_provider.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/custom_app_bar.dart';
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
          context.read<WishlistProvider>().setIsFetchingTrue(),
          await context.read<WishlistProvider>().getUser(),
          await context.read<WishlistProvider>().setWishlistLength(),
          await context.read<WishlistProvider>().getProductsList(),
          await context.read<WishlistProvider>().getStoresList(),
          context.read<WishlistProvider>().setIsFetchingFalse(),
        });
  }

  @override
  Widget build(BuildContext context) {
    UserJson user = context.watch<WishlistProvider>().user;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Wishlist",
          backButton: false,
        ),
        body: Stack(
          children: [
            Layout(
                widget: context.watch<WishlistProvider>().isWishlistEmpty
                    ? Container(width: MediaQuery.of(context).size.width,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text('Wishlist is empty')))
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: user.wishlist
                                  .map((e) => WishListCard(
                                        wishlistItem: e,
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
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
