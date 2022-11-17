import 'package:camera/camera.dart';
import 'package:flutterdemo/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/home/widgets/category_card.dart';

class Categories extends StatelessWidget {
  final CameraDescription camera;
  const Categories({required this.camera, super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/clothes.svg", "text": "Clothing"},
      {"icon": "assets/icons/electronics.svg", "text": "Electronics"},
      {"icon": "assets/icons/groceries.svg", "text": "Groceries"},
      {"icon": "assets/icons/beauty.svg", "text": "Beauty"},
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
                                  camera: camera,
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
