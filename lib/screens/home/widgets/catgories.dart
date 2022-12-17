import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:provider/provider.dart';
import '../../search/search.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories
                  .map(
                    (cat) => CategoryCard(
                      category: cat,
                      onPress: () async {
                        List<ProductJson> list = await context
                            .read<HomeProvider>()
                            .getCategoryProducts(cat["text"]);
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => Search(
                                      allProducts: list,
                                    )))
                            .then((value) =>
                                context.read<HomeProvider>().getUser());
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
