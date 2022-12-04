import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/widgets/product.dart';
import '../../models/product_model.dart';
import '../product_detail/product_detail.dart';

class StaggeredProductView extends StatelessWidget {
  final List<ProductJson> demoList;

  const StaggeredProductView(
      {required this.demoList, super.key});

  Widget _buildProducts(BuildContext context, int index) {
    ProductJson product = demoList[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ProductDetail(
                product: product,
                  )),
        );
      },
      child: ProductCard(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
      padding: const EdgeInsets.only(bottom: 10.0),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: demoList.length,
      itemBuilder: (context, index) {
        return Transform.translate(
          offset: Offset(0.0, index.isOdd ? 50 : 0.0),
          child: _buildProducts(context, index),
        );
      }),
    );
  }
}
