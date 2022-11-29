import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../store/store_main.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails({
    Key? key,
    required this.camera,
    required this.product,
  }) : super(key: key);

  final Product product;
  final CameraDescription camera;

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
    context.read<HomeProvider>().getStore(widget.product.storeId));
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StoreMain(
                camera: widget.camera,
              ),
            ),
          );
        },
        child: Text(
          context.watch<HomeProvider>().store.storeName,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
