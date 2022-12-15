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
  Search({super.key, this.category = '', });

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
      context.read<SearchProvider>().getCategoryProducts(widget.category),
    });

  }

  @override
  Widget build(BuildContext context) {
    List<ProductJson> products = context.watch<SearchProvider>().changedProducts;

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


