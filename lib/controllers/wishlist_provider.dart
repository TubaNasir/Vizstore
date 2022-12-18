import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/wishlist_json.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/repositories/product_repository.dart';
import '../models/store_json.dart';
import '../models/user_json.dart';
import '../repositories/store_repository.dart';

class WishlistProvider with ChangeNotifier {
  WishlistProvider(
      this._storeRepository, this._productRepository, this._userRepository);

  final ProductRepository _productRepository;
  final UserRepository _userRepository;
  final StoreRepository _storeRepository;

  UserJson _user = UserJson.empty();
  List<ProductJson> _products = [];
  List<StoreJson> _stores = [];
  List<ProductJson> _wishlistProducts = [];
  bool _isFetching = true;
  bool _isWishlistEmpty = false;


  UserJson get user => _user;
  List<ProductJson> get wishlistProducts => _wishlistProducts;
  bool get isFetching => _isFetching;
  bool get isWishlistEmpty => _isWishlistEmpty;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  ProductJson getProductInfo(String id) {
    ProductJson product = ProductJson.empty();
    for (var product in _products) {
      if (id == product.id) {
        return product;
      }
    }
    return product;
  }

  StoreJson getStoreInfo(String id) {
    StoreJson store = StoreJson.empty();
    for (var store in _stores) {
      if (id == store.id) {
        return store;
      }
    }
    return store;
  }

  Future<void> getProductsList() async {
    _products = await _productRepository.getProductList();
    notifyListeners();
  }

  Future<void> getStoresList() async {
    _stores = await _storeRepository.getStoresList();
    notifyListeners();
  }

  Future<void> setWishlistLength() async{
    _isWishlistEmpty = user.wishlist.isEmpty;
    notifyListeners();
  }

  Future<void> updateWishlist(String productId) async {
    List<WishlistItemJson> newWishlist = [];
    for (var item in user.wishlist) {
      if(item.productId != productId){
        newWishlist.add(item);
      }
    }

    UserJson updatedUser = _user.copyWith(wishlist: newWishlist);
    await _userRepository.updateUser(updatedUser);
    _user = await _userRepository.getUser();
    notifyListeners();
    setWishlistLength();
    notifyListeners();
  }

  bool getIsFavourite(String productId) {
    bool isFav = false;
    isFav = user.wishlist.any((element) => element.productId == productId);
    return isFav;
  }

  void setIsFetchingTrue() {
    _isFetching = true;
    notifyListeners();
  }

  void setIsFetchingFalse() {
    _isFetching = false;
    notifyListeners();
  }
}
