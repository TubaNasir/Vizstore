import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:flutterdemo/cart/widgets/cart_card.dart';
import 'package:flutterdemo/cart/widgets/total_card_cart.dart';
import 'package:flutterdemo/checkout/checkout.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutterdemo/widgets/button.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../success/success.dart';
import '../widgets/customAppBar.dart';
import '../widgets/layout.dart';
import 'product_model.dart';

class Cart extends StatefulWidget {
  final CameraDescription camera;
  const Cart({required this.camera,super.key});

  @override
  State<Cart> createState() => _CartState(camera);
}

class _CartState extends State<Cart> {
  late List<Product1> cartList;
  final CameraDescription camera;

  _CartState(this.camera);

  @override
  void initState() {
    cartList = [
      Product1(
          id: 1,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™ nsadfk akjdnaksj kjands",
          price: 1000,
          description:
              "This is a red shirt. Material is agdjd dlfk skrn fjrndf erfr kenedf resjfnr",
          storeID: 1,
          qty: 1),
      Product1(
          id: 2,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™",
          price: 1000,
          description: "This is a red shirt. Material is agdjd",
          storeID: 1,
          qty: 1),
      Product1(
          id: 3,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™",
          price: 1000,
          description: "This is a red shirt. Material is agdjd",
          storeID: 1,
          qty: 1),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  children: cartList
                      .map((e) => CartCard(
                          product: e,
                          cartList: cartList,
                          onCartChanged: () {
                            setState(() {});
                          }))
                      .toList(),
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: cartList.length,
                //   itemBuilder: (context, index) {
                //     return Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       //CartCards(productImage: cartList[index].image, cardTitle: cartList[index].title, cardSubtitle: cartList[index].price.toString(), press: (){}),
                //       child: CartCard(
                //         product: cartList[index],
                //         cartList: cartList,
                //         onCartChanged: () {
                //           setState(() {});
                //         },
                //       ),
                //     );
                //   },
                // ),
                TotalCardCart(),
                SizedBox(height: 20),
                CustomButton(
                  text: 'Checkout',
                  pressed: () {
                    Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Checkout(camera: camera,))
                            );
                  },
                ),
                SizedBox(height: 100),
              ]),
            )),
            BottomNavBar(camera: camera,)
          ])),
    );
  }
}


