import 'package:flutter/material.dart';
import 'package:flutterdemo/models/user_model.dart';
import 'package:flutterdemo/screens/cart/widgets/cart_card.dart';
import 'package:flutterdemo/screens/cart/widgets/total_card_cart.dart';
import 'package:provider/provider.dart';
import '../../controllers/home_provider.dart';
import '../../models/product_model.dart';
import '../checkout/checkout.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/layout.dart';

class Cart extends StatefulWidget {

  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late List<ProductJson> cartList;

  @override
  void initState() {
    cartList = [
      ProductJson(
          id: "1",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™ nsadfk akjdnaksj kjands",
          price: 1000,
          description:
              "This is a red shirt. Material is agdjd dlfk skrn fjrndf erfr kenedf resjfnr",
          storeId: "1",
          category: "Clothing",
          sold: 1,
          stock: 1),
      ProductJson(
          id: "2",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™",
          price: 1000,
          description: "This is a red shirt. Material is agdjd",
          storeId: "1",
          category: "Clothing",
          sold: 1,
          stock: 1),
      ProductJson(
          id: "3",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™",
          price: 1000,
          description: "This is a red shirt. Material is agdjd",
          storeId: "1",
          category: "Clothing",
          sold: 1,
          stock: 1),
    ];
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => {
      context.read<HomeProvider>().getProductsList(),
      context.read<HomeProvider>().getUser()
    });
  }

  @override
  Widget build(BuildContext context) {

    UserJson user = context.watch<HomeProvider>().user;

    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(
            title: "Cart",
            backButton: false,
          ),
          //backgroundColor: Colors.grey.shade200,
          body: Stack(children: [
            Layout(
                widget: SingleChildScrollView(
                  child: Column(children: [
                    Column(
                      children: user.cart
                          .map((e) => CartCard(
                        cartItem: e,
                        onCartChanged: () {
                          setState(() {});
                        },
                      ))
                          .toList(),
                    ),
                    TotalCardCart(),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'Checkout',
                      pressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Checkout()));
                      },
                    ),
                    SizedBox(height: 100),
                  ]),
                ),
                ),
            BottomNavBar()
          ])
      ),
    );
  }
}

