import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/search_provider.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/screens/camera/camera.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:flutterdemo/screens/search/search.dart';
import 'package:provider/provider.dart';

class SearchPageBar extends StatefulWidget {
  SearchPageBar({super.key, required this.searchText});

  String searchText = '';

  @override
  State<SearchPageBar> createState() => _SearchPageBarState();
}

class _SearchPageBarState extends State<SearchPageBar> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //findproducts(widget.text) method from search provider
    // WidgetsBinding.instance.addPostFrameCallback((_) =>
    // {
    //   context.read<SearchProvider>().getFilteredProducts(widget.text)
    // });
  }
  @override
  Widget build(BuildContext context) {
    String searchText = context
        .watch<SearchProvider>()
        .searchText;
   // TextEditingController controllerSearch = TextEditingController(text: widget.text);

//watchfiltered products
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
             // controller: controllerSearch,
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
