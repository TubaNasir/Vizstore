import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/home/home_model.dart';
import 'package:flutterdemo/product_detail/widgets/clipped_image.dart';
import 'package:flutterdemo/product_detail/widgets/store_details.dart';
import 'package:flutterdemo/product_detail/widgets/title_row.dart';

class ProductBody extends StatefulWidget {
  ProductBody({required this.product, required this.camera, Key? key}) : super(key: key);

  Product product;
  CameraDescription camera;
  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClippedImage(product: widget.product),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TitleRow(product: widget.product),
                          const SizedBox(height: 5),
                          StoreDetails(camera: widget.camera),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0),
                        child: Text(
                          'Rs. ${widget.product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: TextColor1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Description',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: TextColor2),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.product.description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
