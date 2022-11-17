import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/storeManager/widgets/bottom_nav_bar_store/bottom_nav_bar_store.dart';
import 'package:flutterdemo/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/home/home_model.dart';

import '../../home/home.dart';
import '../../search/search.dart';
import '../../widgets/layout.dart';

class StoreHome extends StatelessWidget {
  const StoreHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Store Name",
          backButton: false,
        ),
        body: Stack(
          children: [Padding(
            padding: const EdgeInsets.all(14.0),
            child: Layout(
              widget: SingleChildScrollView(
                child: Column(
                  children: [
                    //Heading(text: 'Products'),
                    SizedBox(height: 20,),
                    ProductList(demoList: demoProducts),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
          ),
            BottomNavBarStore()
      ]
        ),

      ),
    );
  }
}
