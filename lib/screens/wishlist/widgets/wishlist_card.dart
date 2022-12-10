import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/wishlist_provider.dart';
import 'package:flutterdemo/models/store_model.dart';
import 'package:flutterdemo/models/wishlist_model.dart';
import 'package:flutterdemo/screens/wishlist/widgets/wishlist_card_details.dart';
import 'package:provider/provider.dart';
import '../../product_detail/product_detail.dart';
import '../../widgets/image_widget.dart';
import '../../../models/product_model.dart';

class WishListCard extends StatelessWidget {
  const WishListCard({Key? key, required this.wishlistItem}) : super(key: key);

  final WishlistItemJson wishlistItem;

  @override
  Widget build(BuildContext context) {
    ProductJson product =
        context.watch<WishlistProvider>().getProduct(wishlistItem.productId);
    StoreJson store =
        context.watch<WishlistProvider>().getStore(product.storeId);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetail(product: demoProducts[0])));
        },
        style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageWidget(productImage: product.image),
            const SizedBox(
              width: 20,
            ),
            TitleWidgetWishlist(
              title: product.title,
              price: product.price,
              storeName: store.storeName,
              onPressed: () =>
                  context.read<WishlistProvider>().updateWishlist(product.id),

            ),
          ],
        ),
      ),
    );
  }
}
