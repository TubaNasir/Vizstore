import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/home_provider.dart';
import '../../../models/product_json.dart';
import '../../product_detail/product_detail.dart';
import '../../widgets/product_card.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  Widget build(BuildContext context) {
    List<ProductJson> popularProducts =
        context.watch<HomeProvider>().popularProducts;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 210,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: popularProducts
                  .map((product) => Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ProductDetail(product: product,
                                            ))).then((value) => context.read<HomeProvider>().getUser());
                            },
                            child: ProductCard(
                              product: product,
                              isFav: context
                                  .read<HomeProvider>()
                                  .getIsFavourite(product.id),
                              onPressed: () => context
                                  .read<HomeProvider>()
                                  .updateWishlist(product.id),
                            )),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
