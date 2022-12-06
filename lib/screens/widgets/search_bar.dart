import 'package:camera/camera.dart';
import 'package:flutterdemo/controllers/search_provider.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/search/search.dart';
import 'package:provider/provider.dart';

import '../camera/camera.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    String searchText = context
        .read<SearchProvider>()
        .searchText;

    TextEditingController controllerSearch = TextEditingController(text: searchText);

    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: SecondaryColor, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: [
          Expanded(
            child:
              TextFormField(
                initialValue: searchText,
                //controller: controllerSearch,
                decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(horizontal: 90, vertical: 9)),
               onFieldSubmitted: (String text){
                 context.read<SearchProvider>().setSearchItem(text);
                 context.read<SearchProvider>().getFilteredProducts();
                  //context.read<SearchProvider>().setSearchItem(text);
                 Navigator.of(context).push(MaterialPageRoute(
                     builder: (context) => Search(
                     )));
               },
                onChanged: (String text){


                },

              ),
          ),
          IconButton(
            onPressed: () async {
              // Obtain a list of the available cameras on the device.
              final cameras = await availableCameras();
              // Get a specific camera from the list of available cameras.
              final firstCamera = cameras[0];
              Navigator.of(context).push(
                MaterialPageRoute(builder:(context) => CameraScreen(camera: firstCamera))
              );
            },
            icon: Icon(Icons.camera_alt,color: Colors.black,)
          )
        ],
      ),
    );
  }
}


