import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../widgets/custom_app_bar/custom_app_bar.dart';
import '../widgets/staggered_products.dart';

class StoreMain extends StatelessWidget {
  const StoreMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Store Name",
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
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
