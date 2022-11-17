import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:flutterdemo/checkout/checkout.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/curve_clipper.dart';
import 'package:flutterdemo/widgets/customAppBar2.dart';
import 'package:flutter/material.dart';
import '../home/home_model.dart';
import 'package:flutterdemo/cart/product_model.dart';


class ProductDetail extends StatefulWidget {
  final CameraDescription camera;
  ProductDetail({required this.camera,super.key});

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
                        ClipPath(
                          clipper : CurveClipper(),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: SecondaryColor,
                                ),
                                child: Image.network(product.image, fit: BoxFit.fitHeight),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                          child: Text(product.title,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold,),
                                            maxLines:5,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.1),
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.favorite_border_rounded,
                                            size: 30,
                                            color: Colors.black.withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Text('By Clothing Brand',
                                      style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text('Rs. ${product.price}',
                                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: PrimaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Description',
                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: TextColor2),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Text(product.description,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 100),
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
              //left: -8.0,
              bottom: 0,
              width: MediaQuery.of(context).size.width +8,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, -3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
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
                                      if (product.quantity == 0 ) {
                                        return;
                                      }
                                      else{
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
                                  " ${product.quantity} " ,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
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
                    Container(
                      width: MediaQuery.of(context).size.width/2 + 8,
                      height: 78,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Checkout(camera: camera,),
                            ),
                          );
                        },
                        child: Ink(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            gradient: PrimaryGradientColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(80.0), bottomLeft: Radius.circular(80.0)),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Add to Cart',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomAppBar2(),
          ],
        ),
      ),
    );
  }
}