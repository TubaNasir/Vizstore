import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/models/wishlist_json.dart';
import 'package:flutterdemo/repositories/firebase_product_repository.dart';

class StoreProvider with ChangeNotifier {

  StoreProvider(this._productRepository, this._userRepository);

  ProductRepository _productRepository;
  UserRepository _userRepository;
  List<ProductJson> _products = [];
  List<ProductJson> _storeProducts = [];
  UserJson _user = UserJson.empty();

  List<ProductJson> get products => _products;
  List<ProductJson> get storeProducts => _storeProducts;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> getProductsList() async {
    _products = await _productRepository.getProductList();
    notifyListeners();
  }

  ProductJson getProduct(String id) {
    ProductJson product = ProductJson.empty();
    for (var product in _products) {
      if (id == product.id) {
        return product;
      }
    }
    return product;
  }

  void getProductsFromStore(String id) {
    List<ProductJson> list = _products.where((element) => getProduct(element.id).storeId == id).toList();
    print('in get products from store');
    _storeProducts = list;
    notifyListeners();
  }

  bool getIsFavourite(String productId) {
    bool isFav = false;
    isFav  = _user.wishlist.any((element) => element.productId == productId);
    return isFav;
  }

  Future<void> updateWishlist(String productId) async {
    List<WishlistItemJson> newWishlist = [];
    var contain = _user.wishlist.any((element) => element.productId == productId);
    if (contain)
    {
      for (var item in _user.wishlist){
        if(item.productId != productId){
          newWishlist.add(item);
        }
      }
    }
    else
    {
      for (var item in _user.wishlist){
        newWishlist.add(item);
      }
      newWishlist.add(WishlistItemJson(productId: productId));
    }
    UserJson updatedUser = _user.copyWith(wishlist: newWishlist);
    await _userRepository.updateUser(updatedUser);
    _user = await _userRepository.getUser();
    notifyListeners();
  }
}