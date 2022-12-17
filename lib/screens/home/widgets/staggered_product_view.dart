import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/screens/product_detail/product_detail.dart';
import 'package:flutterdemo/screens/widgets/product.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';

class StaggeredProductView extends StatelessWidget {
  final List<ProductJson> products;

  const StaggeredProductView(
      {required this.products, super.key});

  Widget _buildProducts(BuildContext context, int index) {
    ProductJson product = products[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ProductDetail(
                product: product,
              )),
        ).then((value) => context.read<HomeProvider>().getUser());
      },
      child: ProductCard(product: product,
          isFav: context.read<HomeProvider>().getIsFavourite(product.id),
          onPressed: () => context.read<HomeProvider>().updateWishlist(product.id),
      ),
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
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Transform.translate(
              offset: Offset(0.0, index.isOdd ? 30 : 0.0),
              child: _buildProducts(context, index),
            );
          }),
    );
  }
}
