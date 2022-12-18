import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/cart_provider.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/screens/cart/widgets/cart_card.dart';
import 'package:flutterdemo/screens/cart/widgets/total_card_cart.dart';
import 'package:provider/provider.dart';
import '../checkout/checkout.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/layout.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
          await context.read<CartProvider>().setIsFetching(),
          await context.read<CartProvider>().getUser(),
          await context.read<CartProvider>().setCartLength(),
          await context.read<CartProvider>().getProductsList(),
          await context.read<CartProvider>().getStoresList(),
          context.read<CartProvider>().setTotal(),

    });
  }

  @override
  Widget build(BuildContext context) {
    UserJson user = context.watch<CartProvider>().user;
    bool isFetching = context.watch<CartProvider>().isFetching;
    print('cart ${context.watch<CartProvider>().isCartEmpty}');
    print('isftchvjf ${context.watch<CartProvider>().isFetching}');

    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(
            title: "Cart",
            backButton: false,
          ),
          body: Stack(children: [
            Layout(
              widget: context.watch<CartProvider>().isCartEmpty
                  ? Text('Cart is empty')
                  : SingleChildScrollView(
                      child: Column(children: [
                        Column(
                          children: user.cart
                              .map((e) => CartCard(cartItem: e))
                              .toList(),
                        ),
                        isFetching ? Container() : TotalCardCart(),
                        SizedBox(height: 20),
                        isFetching
                            ? Container()
                            : CustomButton(
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
          ])),
    );
  }
}
