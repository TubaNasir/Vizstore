import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/search_provider.dart';
import 'package:flutterdemo/screens/search/widgets/search_page_bar.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/layout.dart';
import '../widgets/search_bar.dart';
import '../widgets/staggered_products.dart';

class Search extends StatefulWidget {
  Search({super.key, this.category = '',});

  String category;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async =>
    {
      await context.read<SearchProvider>().getProductsList(),
      if(widget.category != '') {
        print('init search '+ widget.category),
      context.read<SearchProvider>().getCategoryProducts(widget.category)
    }
      else
        {
          print('init search no catg'),
          context.read<SearchProvider>().getFilteredProducts()
        }

    });

  }

  @override
  Widget build(BuildContext context) {
    List<ProductJson> products = [];
    if(widget.category != '') {
      print('in search no filter');
      products = context
          .watch<SearchProvider>()
          .categoryProducts;
    }
    else {
      print('in search no catg');
      products = context
          .watch<SearchProvider>()
          .filteredProducts;
    }


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Search", backButton: true),
        body: Layout(
          widget: SingleChildScrollView(
            child: Column(
              children: [
                //SearchPageBar(text: widget.text,),
                SearchPageBar(),
                const SizedBox(height: 20),
                (products.isNotEmpty)
                    ? StaggeredProductView(
                        demoList: products,
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


