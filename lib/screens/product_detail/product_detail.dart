import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/product_detail/widgets/bottom_bar.dart';
import 'package:flutterdemo/screens/product_detail/widgets/product_body.dart';
import '../../models/product_model.dart';
import '../widgets/custom_app_bar2.dart';

class ProductDetail extends StatelessWidget {
  final CameraDescription camera;
  const ProductDetail({required this.camera, required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            ProductBody(product: product, camera: camera),
            BottomBar(product: product, camera: camera),
            const CustomAppBar2(),
          ],
        ),
      ),
    );
  }
}

