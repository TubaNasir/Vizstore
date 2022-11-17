import 'package:camera/camera.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/home/home_model.dart';
import 'package:flutterdemo/product_detail/product_detail.dart';
import 'package:flutterdemo/widgets/button.dart';
import 'package:flutterdemo/widgets/customAppBar.dart';
import 'package:flutterdemo/widgets/layout.dart';
import 'package:flutterdemo/widgets/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/product.dart';
import 'package:flutterdemo/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  final CameraDescription camera;
  const Search({required this.camera,super.key});

  @override
  State<Search> createState() => _SearchState(camera);
}

class _SearchState extends State<Search> {
  final CameraDescription camera;
  _SearchState(this.camera);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Search", backButton: true),
        body: Layout(
          widget: Column(
            children: [
              SearchBar(camera: camera),
              const SizedBox(height: 20),
              (demoProducts.isNotEmpty)
                  ? 
                // Expanded(
                // child: ProductList(demoList: demoProducts,),)
                Products(demoList: demoProducts,camera: camera,)
                  : const Text('No Products Found'),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  ProductList({Key? key, required this.demoList}) : super(key: key);

  List<Product> demoList;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              primary: false,
              crossAxisCount: 2,
              children: List.generate(demoList.length, (index) {
                return ProductCard(product: demoList[index]);
              }),
            ),
          ],
        ),
      );
  }
}

class Products extends StatelessWidget {
  final List<Product> demoList;
  final CameraDescription camera;

  const Products({required this.camera, required this.demoList,super.key});

  Widget _buildProducts(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Product product = demoList[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetail(camera: camera,)
          ),
        );
      },
      child: ProductCard(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 10.0),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: demoList.length,
          itemBuilder: (context, index) {
            return Transform.translate(
              offset: Offset(0.0, index.isOdd ? 50 : 0.0),
              child: _buildProducts(context, index),
            );
          }),
    ));
  }
}

