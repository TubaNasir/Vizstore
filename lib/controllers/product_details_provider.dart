import 'package:flutter/material.dart';
import 'package:flutterdemo/models/cart_item_json.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/models/wishlist_item_json.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/store_json.dart';
import '../models/user_json.dart';
import '../repositories/firebase_store_repository.dart';
import 'package:flutterdemo/domain/user_repository.dart';

class ProductDetailsProvider with ChangeNotifier {
  ProductDetailsProvider(this._storeRepository, this._userRepository);

  final FirebaseStoreRepository _storeRepository;
  final UserRepository _userRepository;

  StoreJson _store = const StoreJson.empty();
  UserJson _user = UserJson.empty();
  int _quantity = 1;
  bool _isFetching = true;

  StoreJson get store => _store;
  UserJson get user => _user;
  int get quantity => _quantity;
  bool get isFetching => _isFetching;

  Future<void> incrementQuantity(String productId) async {
    List<CartItemJson> newCart = [];
    _quantity = _quantity + 1;
    var contain = user.cart.any((element) => element.productId == productId);
    if (contain) {
      for(var item in user.cart){
        if(item.productId == productId){
          CartItemJson i = item.copyWith(
              productId: item.productId, quantity: item.quantity + 1);
          newCart.add(i);
        }
        else{
          newCart.add(item);
        }
      }
      await updateList(newCart);
    }
    notifyListeners();


  }



  Future<void> decrementQuantity(String productId) async {
    List<CartItemJson> newCart = [];
    if (_quantity != 1) {
      _quantity = _quantity - 1;
    }
    var contain = user.cart.any((element) => element.productId == productId);
    if (contain) {
      for(var item in user.cart){
        if(item.productId == productId){
          if (item.quantity != 1) {
            CartItemJson i = item.copyWith(
                productId: item.productId, quantity: item.quantity - 1);
            newCart.add(i);
          }
        }
        else{
          newCart.add(item);
        }
      }
      await updateList(newCart);
    }
    notifyListeners();


  }

  void addToCart(String productId) async {
    List<CartItemJson> newCart = [];
    var contain = user.cart.any((element) => element.productId == productId);
    if (contain) {
      showCartToast('Product is already in cart');
    } else {
      for (var item in user.cart) {
        newCart.add(item);
      }
      print('qty' +_quantity.toString());
      newCart.add(CartItemJson(productId: productId, quantity: _quantity));
      // _quantity = 1;
      // notifyListeners();
      await updateList(newCart);
      showCartToast('Added to cart');
    }
  }

  Future<void> updateList(List<CartItemJson> newCart) async {
    UserJson updatedUser = _user.copyWith(cart: newCart);
    await _userRepository.updateUser(updatedUser);
    notifyListeners();
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> getStore(String id) async {
    _store = await _storeRepository.getStoreInfo(id);
    notifyListeners();
  }

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> resetQuantity(ProductJson product) async {
    for(var item in user.cart){
      if(item.productId == product.id){
        _quantity = item.quantity;
        notifyListeners();
        break;
      }
      else {
        _quantity = 1;
        notifyListeners();
      }
    }

  }

  void showCartToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: SecondaryColor,
        textColor: Colors.black);
  }

  Future<void> updateWishlist(String productId) async {
    List<WishlistItemJson> newWishlist = [];
    var contain =
        _user.wishlist.any((element) => element.productId == productId);
    if (contain) {
      for (var item in _user.wishlist) {
        if (item.productId != productId) {
          newWishlist.add(item);
        }
      }
    } else {
      for (var item in _user.wishlist) {
        newWishlist.add(item);
      }
      newWishlist.add(WishlistItemJson(productId: productId));
    }
    UserJson updatedUser = _user.copyWith(wishlist: newWishlist);
    await _userRepository.updateUser(updatedUser);
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  bool getIsFavourite(String productId) {
    bool isFav = false;
    isFav = _user.wishlist.any((element) => element.productId == productId);
    return isFav;
  }

  void showOutOfStock() {
    showOutOfStockToast('Product out of stock');
  }

  void showOutOfStockToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: SecondaryColor,
        textColor: Colors.black);
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
