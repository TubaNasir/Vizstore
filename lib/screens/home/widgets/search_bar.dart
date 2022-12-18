import 'package:camera/camera.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/screens/camera/choice.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/search/search.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: SecondaryColor, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child:
              TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(horizontal: 90, vertical: 9)),
               onFieldSubmitted: (String text){
                  if(text != '') {
                    context.read<HomeProvider>().setSearchItem(text);
                    List<ProductJson> list = context.read<HomeProvider>().getFilteredProducts();

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Search(
                              allProducts: list,
                              searchText: text,
                            ))).then((value) => context.read<HomeProvider>().getUser());
                  }
               },
              ),
          ),
          IconButton(
            onPressed: () async {
              final cameras = await availableCameras();
              final firstCamera = cameras[0];
              Navigator.of(context).push(
                MaterialPageRoute(builder:(context) => ChoiceScreen())
              );
            },
            icon: Icon(Icons.camera_alt,color: Colors.black,)
          )
        ],
      ),
    );
  }
}


