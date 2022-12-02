import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/layout.dart';
import '../widgets/search_bar.dart';
import '../widgets/staggered_products.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Search", backButton: true),
        body: Layout(
          widget: SingleChildScrollView(
            child: Column(
              children: [
                SearchBar(),
                const SizedBox(height: 20),
                (demoProducts.isNotEmpty)
                    ? StaggeredProductView(
                        demoList: demoProducts,
                      )
                    : const Text('No Products Found'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


