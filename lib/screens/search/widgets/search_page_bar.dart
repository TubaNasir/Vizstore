import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/search_provider.dart';
import 'package:flutterdemo/screens/camera/camera.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:provider/provider.dart';

class SearchPageBar extends StatefulWidget {
  SearchPageBar({super.key, required this.searchText});

  String searchText = '';

  @override
  State<SearchPageBar> createState() => _SearchPageBarState();
}

class _SearchPageBarState extends State<SearchPageBar> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: SecondaryColor, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: [
          Expanded(
            child:
            TextFormField(
              initialValue: widget.searchText,
              decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(horizontal: 90, vertical: 9)),
              onFieldSubmitted: (String text){
                context.read<SearchProvider>().setSearchItem(text);
                context.read<SearchProvider>().getFilteredProducts();
              },
              onChanged: (String text){
                context.read<SearchProvider>().setSearchItem(text);
                context.read<SearchProvider>().getFilteredProducts();
              },

            ),
          ),
          IconButton(
              onPressed: () async {
                final cameras = await availableCameras();
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
