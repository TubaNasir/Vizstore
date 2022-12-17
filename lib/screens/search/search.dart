import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/search_provider.dart';
import 'package:flutterdemo/screens/search/widgets/search_page_bar.dart';
import 'package:flutterdemo/screens/search/widgets/staggered_product_view.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/layout.dart';

class Search extends StatefulWidget {
  Search({super.key, required this.allProducts, this.searchText = '', this.imagePath = ''});

  List<ProductJson> allProducts = [];
  String searchText;
  String imagePath;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
          await context.read<SearchProvider>().getUser(),
          await context.read<SearchProvider>().getProductsList(),
          context.read<SearchProvider>().setProducts(widget.allProducts),
          context.read<SearchProvider>().setSearchItem(widget.searchText)
        });
  }

  @override
  Widget build(BuildContext context) {
    List<ProductJson> products =
        context.watch<SearchProvider>().changedProducts;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Search", backButton: true),
        body: Layout(
          widget: SingleChildScrollView(
            child: Column(
              children: [
                SearchPageBar(searchText: widget.searchText,),
                const SizedBox(height: 20),
                widget.imagePath.isNotEmpty ?
                Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.file(File(widget.imagePath)), //ADD BOUNDARY
                    ),
                    const SizedBox(height: 20),
                    Text('Related Products', style: Theme.of(context).textTheme.titleMedium,),
                    const SizedBox(height: 8),
                    (products.isNotEmpty)
                        ? StaggeredProductView(
                      products: products,
                    )
                        : const Text('No Products Found'),
                  ],
                )
                :
                (products.isNotEmpty)
                    ? StaggeredProductView(
                        products: products,
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
