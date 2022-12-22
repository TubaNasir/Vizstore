import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/store_provider.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/models/store_json.dart';
import 'package:flutterdemo/screens/home/widgets/heading.dart';
import 'package:flutterdemo/screens/store/widgets/staggered_product_view.dart';
import 'package:flutterdemo/screens/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class StoreMain extends StatefulWidget {
  const StoreMain({Key? key, required this.store}) : super(key: key);

  final StoreJson store;

  @override
  State<StoreMain> createState() => _StoreMainState();
}

class _StoreMainState extends State<StoreMain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
      context.read<StoreProvider>().setIsFetchingTrue(),
          await context.read<StoreProvider>().getProductsList(),
          await context.read<StoreProvider>().getProductsFromStore(widget.store.id),
      context.read<StoreProvider>().setIsFetchingFalse(),

    });
  }

  @override
  Widget build(BuildContext context) {
    print('store ${widget.store.storeName}');
    List<ProductJson> storeProducts =
        context.watch<StoreProvider>().getProductsFromStore(widget.store.id);

    bool isFetching = context.watch<StoreProvider>().isFetching;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.store.storeName,
          backButton: true,
        ),
        body: context.watch<StoreProvider>().isFetching
            ? Center(child: CircularProgressIndicator())
            :Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Heading(text: 'Our Products'),
                const SizedBox(height: 10),
                SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: StaggeredProductView(
                      products: storeProducts,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
