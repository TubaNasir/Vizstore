import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../widgets/bottom_nav_bar/bottom_nav_bar.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/layout.dart';
import 'widgets/cart_body.dart';

class Cart extends StatefulWidget {
  final CameraDescription camera;

  const Cart({required this.camera, super.key});

  @override
  State<Cart> createState() => _CartState(camera);
}

class _CartState extends State<Cart> {
  late List<Product> cartList;
  final CameraDescription camera;

  _CartState(this.camera);

  @override
  void initState() {
    cartList = [
      Product(
          id: 1,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™ nsadfk akjdnaksj kjands",
          price: 1000,
          description:
              "This is a red shirt. Material is agdjd dlfk skrn fjrndf erfr kenedf resjfnr",
          storeID: 1,
          quantity: 1),
      Product(
          id: 2,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™",
          price: 1000,
          description: "This is a red shirt. Material is agdjd",
          storeID: 1,
          quantity: 1),
      Product(
          id: 3,
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
          title: "Wireless Controller for PS4™",
          price: 1000,
          description: "This is a red shirt. Material is agdjd",
          storeID: 1,
          quantity: 1),
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
                widget: CartBody(camera: camera, cartList: cartList,)),
            BottomNavBar(
              camera: camera,
            )
          ])
      ),
    );
  }
}

