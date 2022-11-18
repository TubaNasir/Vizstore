import 'package:camera/camera.dart';
import 'package:flutterdemo/product_detail/widgets/bottom_bar.dart';
import 'package:flutterdemo/product_detail/widgets/product_body.dart';
import 'package:flutterdemo/widgets/custom_app_bar2.dart';
import 'package:flutter/material.dart';
import '../home/home_model.dart';

class ProductDetail extends StatefulWidget {
  final CameraDescription camera;
  ProductDetail({required this.camera, super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState(camera);
}

class _ProductDetailState extends State<ProductDetail> {
  final Product product = demoProducts[0];

  final CameraDescription camera;
  _ProductDetailState(this.camera);

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

