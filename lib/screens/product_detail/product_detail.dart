import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/product_details_provider.dart';
import 'package:flutterdemo/screens/product_detail/widgets/bottom_bar.dart';
import 'package:flutterdemo/screens/product_detail/widgets/product_body.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../widgets/custom_app_bar2.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({required this.product, super.key});

  final ProductJson product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
      context.read<ProductDetailsProvider>().getUser()
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            ProductBody(product: widget.product),
            BottomBar(product: widget.product),
            CustomAppBar2(
              onPressed : () {
                context.read<ProductDetailsProvider>().resetQuantity();
              }
            ),
          ],
        ),
      ),
    );
  }
}

