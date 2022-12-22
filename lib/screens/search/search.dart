import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/search_provider.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/screens/search/widgets/search_page_bar.dart';
import 'package:flutterdemo/screens/search/widgets/staggered_product_view.dart';
import 'package:flutterdemo/screens/widgets/custom_app_bar.dart';
import 'package:flutterdemo/screens/widgets/custom_app_bar_search.dart';
import 'package:flutterdemo/screens/widgets/layout.dart';
import 'package:provider/provider.dart';

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
          context.read<SearchProvider>().setIsFetchingTrue(),
          await context.read<SearchProvider>().getUser(),
          await context.read<SearchProvider>().getProductsList(),
          context.read<SearchProvider>().setProducts(widget.allProducts),
          context.read<SearchProvider>().setSearchItem(widget.searchText),
          context.read<SearchProvider>().setIsFetchingFalse(),
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFetching = context.watch<SearchProvider>().isFetching;
    List<ProductJson> products =
        context.watch<SearchProvider>().changedProducts;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBarSearch(title: "Search", backButton: true),
        body: context.watch<SearchProvider>().isFetching
            ? Center(child: CircularProgressIndicator())
            :Layout(
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
                    ? isFetching ? Center(child: CircularProgressIndicator()) : StaggeredProductView(
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
