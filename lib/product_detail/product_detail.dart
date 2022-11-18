import 'package:camera/camera.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/product_detail/widgets/add_to_cart_button.dart';
import 'package:flutterdemo/product_detail/widgets/clipped_image.dart';
import 'package:flutterdemo/product_detail/widgets/store_details.dart';
import 'package:flutterdemo/product_detail/widgets/title_row.dart';
import 'package:flutterdemo/widgets/custom_app_bar2.dart';
import 'package:flutter/material.dart';
import '../home/home_model.dart';

class ProductDetail extends StatefulWidget {
  final CameraDescription camera;
  ProductDetail({required this.camera, super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState(camera);
}

class _ProductDetailState extends State<ProductDetail> {
  final Product product = demoProducts[0];

  final CameraDescription camera;
  _ProductDetailState(this.camera);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ClippedImage(product: product),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TitleRow(product: product),
                                  const SizedBox(height: 5),
                                  StoreDetails(camera: camera),
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
                                  'Rs. ${product.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: PrimaryColor),
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
                                            product.description,
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
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width + 8,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, -3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFFA7B2AD), Colors.white],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      //widget.actualProduct.qty--;
                                      if (product.quantity == 0) {
                                        return;
                                      } else {
                                        product.quantity--;
                                      }
                                    });
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  " ${product.quantity} ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      product.quantity++;
                                    });
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                    AddToCartButton(camera: camera),
                  ],
                ),
              ),
            ),
            const CustomAppBar2(),
          ],
        ),
      ),
    );
  }
}
