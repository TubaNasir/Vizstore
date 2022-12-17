import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/home_provider.dart';
import 'package:flutterdemo/controllers/product_details_provider.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:provider/provider.dart';
import '../../store/store_main.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductJson product;

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => context
        .read<ProductDetailsProvider>()
        .getStore(widget.product.storeId));
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StoreMain(
                store: context.read<HomeProvider>().store,
              ),
            ),
          );
        },
        child: Text(
          context.watch<ProductDetailsProvider>().store.storeName,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
