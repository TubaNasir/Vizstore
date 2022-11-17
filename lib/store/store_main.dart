import 'package:flutterdemo/home/home_model.dart';
import 'package:flutterdemo/search/search.dart';
import 'package:flutterdemo/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

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
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            //Heading(text: 'Products'),
            SizedBox(height: 20,),
            ProductList(demoList: demoProducts,),
          ],
        ),
      ),
    );
  }
}
