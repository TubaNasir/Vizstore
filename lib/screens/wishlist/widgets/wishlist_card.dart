import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/wishlist_provider.dart';
import 'package:flutterdemo/models/store_model.dart';
import 'package:flutterdemo/models/wishlist_model.dart';
import 'package:flutterdemo/screens/wishlist/widgets/wishlist_card_details.dart';
import 'package:provider/provider.dart';
import '../../product_detail/product_detail.dart';
import '../../widgets/image_widget.dart';
import '../../../models/product_model.dart';

class WishListCard extends StatefulWidget {
  const WishListCard({Key? key, required this.product}) : super(key: key);

  final ProductJson product;

  @override
  State<WishListCard> createState() => _WishListCardState();
}

class _WishListCardState extends State<WishListCard> {
  @override
  Widget build(BuildContext context) {
    //ProductJson product = context.watch<WishlistProvider>().getProductInfo(widget.wishlistItem.productId);
    StoreJson store =
        context.watch<WishlistProvider>().getStore(widget.product.storeId);
    bool isFetching = context.watch<WishlistProvider>().isFetching;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: isFetching
          ? SizedBox(
        height: 88.0,
        width: double.infinity,
            child: ElevatedButton(
        style: ElevatedButton.styleFrom(
              elevation: 2,
              padding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: Center(child: CircularProgressIndicator()),
              ),
          )
          : ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ProductDetail(product: demoProducts[0])));
              },
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.s,
                children: [
                  ImageWidget(image: widget.product.image),
                  const SizedBox(
                    width: 20,
                  ),
                  TitleWidgetWishlist(
                    title: widget.product.title,
                    price: widget.product.price,
                    storeName: store.storeName,
                    onPressed: () => context
                        .read<WishlistProvider>()
                        .updateWishlist(widget.product.id),
                  ),
                ],
              ),
            ),
    );
  }
}
