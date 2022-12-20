import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/product_details_provider.dart';
import 'package:flutterdemo/screens/product_detail/widgets/bottom_bar.dart';
import 'package:flutterdemo/screens/product_detail/widgets/product_body.dart';
import 'package:provider/provider.dart';
import '../../models/product_json.dart';
import '../widgets/custom_app_bar2.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    required this.product,
    super.key,
  });

  final ProductJson product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
      context.read<ProductDetailsProvider>().setIsFetchingTrue(),
      await context.read<ProductDetailsProvider>().getUser(),
      await context.read<ProductDetailsProvider>().resetQuantity(widget.product),
      context.read<ProductDetailsProvider>().setIsFetchingFalse(),
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFetching = context.watch<ProductDetailsProvider>().isFetching;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isFetching ? Center(child: CircularProgressIndicator())
            : Stack(
          clipBehavior: Clip.none,
          children: [
            ProductBody(product: widget.product),
            BottomBar(product: widget.product),
            CustomAppBar2(onPressed: () {
              //context.read<ProductDetailsProvider>().resetQuantity();
            }),
          ],
        ),
      ),
    );
  }
}
