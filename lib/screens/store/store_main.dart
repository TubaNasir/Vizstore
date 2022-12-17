import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/store_provider.dart';
import 'package:flutterdemo/models/store_model.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/staggered_products.dart';


class StoreMain extends StatefulWidget {
  StoreMain({Key? key, required this.store}) : super(key: key);

  StoreJson store;

  @override
  State<StoreMain> createState() => _StoreMainState();
}

class _StoreMainState extends State<StoreMain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => {
          await context.read<StoreProvider>().getProductsList(),
          context.read<StoreProvider>().getProductsFromStore(widget.store.id)
        });
  }

  @override
  Widget build(BuildContext context) {
    List<ProductJson> storeProducts =
        context.watch<StoreProvider>().storeProducts;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.store.storeName,
          backButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
          child: Column(
            children: [
              SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: StaggeredProductView(
                    products: demoProducts,
                  )),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
