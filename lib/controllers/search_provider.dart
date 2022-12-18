import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/models/wishlist_json.dart';
import 'package:flutterdemo/repositories/firebase_product_repository.dart';

class SearchProvider with ChangeNotifier {
  SearchProvider(this._productRepository, this._userRepository);

  FirebaseProductRepository _productRepository;
  UserRepository _userRepository;

  String _searchText = '';
  bool _isFetching = true;
  List<ProductJson> _products = [];
  List<ProductJson> _categoryProducts = [];
  List<ProductJson> _filteredProducts = [];
  List<ProductJson> _changedProducts = [];
  UserJson _user = UserJson.empty();

  List<ProductJson> get products => _products;
  List<ProductJson> get categoryProducts => _categoryProducts;
  List<ProductJson> get filteredProducts => _filteredProducts;
  List<ProductJson> get changedProducts => _changedProducts;
  bool get isFetching => _isFetching;
  String get searchText => _searchText;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> getProductsList() async {
    _products = await _productRepository.getProductList();
    notifyListeners();
  }

  void setProducts(List<ProductJson> list){
    _changedProducts = list;
    notifyListeners();
    _isFetching = false;
  }

  void getFilteredProducts() {
    _filteredProducts = products
        .where((element) =>
            element.title.toLowerCase().contains(_searchText.toLowerCase()) ||
            element.description
                .toLowerCase()
                .contains(_searchText.toLowerCase()))
        .toList();
    _changedProducts = _filteredProducts;
    notifyListeners();
  }

  void setSearchItem(String text) {
    _searchText = text;
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

  void setIsFetchingTrue() {
    _isFetching = true;
    notifyListeners();
  }

  void setIsFetchingFalse() {
    _isFetching = false;
    notifyListeners();
  }
}
