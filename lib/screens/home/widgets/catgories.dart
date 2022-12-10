import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/controllers/search_provider.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../search/search.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/clothes.svg", "text": "Clothes"},
      {"icon": "assets/icons/electronics.svg", "text": "Electronics"},
      {"icon": "assets/icons/groceries.svg", "text": "Lifestyle"},
      {"icon": "assets/icons/beauty.svg", "text": "Furniture"},
      {"icon": "assets/icons/sports.svg", "text": "Sports"},
    ];

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
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Search(
                              category: cat["text"],
                                )));
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
