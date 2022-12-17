import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/cart_model.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/models/wishlist_model.dart';
import 'package:flutterdemo/repositories/product_repository.dart';
import 'package:flutterdemo/screens/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/store_model.dart';
import '../models/user_model.dart';
import '../repositories/store_repository.dart';
import 'package:get_it/get_it.dart';

class ProductDetailsProvider with ChangeNotifier {

  ProductDetailsProvider(this._storeRepository,
      this._userRepository);

  StoreRepository _storeRepository;
  UserRepository _userRepository;

  StoreJson _store = const StoreJson.empty();
  UserJson _user = UserJson.empty();
  int _quantity = 1;
  bool _isFav = false;
  List<ProductJson> _products = [];

  StoreJson get store => _store;

  List<ProductJson> get products => _products;

  UserJson get user => _user;

  int get quantity => _quantity;
  bool get isFav => _isFav;

  void incrementQuantity(){
    _quantity = _quantity + 1;
    notifyListeners();
  }

  void decrementQuantity(){
    if (_quantity != 1){
      _quantity = _quantity - 1;
      notifyListeners();
    }
  }

  void addToCart(String productId) async {
    List<CartItemJson> newCart = [];
    var contain = user.cart.any((element) => element.productId == productId);
    if (contain)
      {
        showCartToast('Product is already in cart');
        print('Already added to cart');
      }
    //value not exists
    else
      {
        for (var item in user.cart){
            newCart.add(item);
        }
        newCart.add(CartItemJson(productId: productId, quantity: _quantity));
        _quantity = 1;
        notifyListeners();
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

  void getStore(String id) async {
    _store = await _storeRepository.getStoreInfo(id);
    notifyListeners();
    print(_store);
  }

  void getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
    print('prov' + _user.firstName);
  }

  void resetQuantity() {
    _quantity = 1;
    notifyListeners();
  }

  void showCartToast(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: SecondaryColor,
        textColor: Colors.black
    );
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
      print('already in wishlist');
    }
    //value not exists
    else
    {
      for (var item in _user.wishlist){
        newWishlist.add(item);
      }
      newWishlist.add(WishlistItemJson(productId: productId));
    }
    UserJson updatedUser = _user.copyWith(wishlist: newWishlist);
    //print(updatedUser.cart[0].quantity);
    await _userRepository.updateUser(updatedUser);
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  bool getIsFavourite(String productId) {
    bool isFav = false;
    isFav = _user.wishlist.any((element) => element.productId == productId);
    print('issfav ${isFav}');
    return isFav;
  }

  // Future<void> updateWishlist(String productId) async {
  //   List<WishlistItemJson> newWishlist = [];
  //   var contain = _user.wishlist.any((element) => element.productId == productId);
  //   if (contain)
  //   {
  //     print('already in wishlist');
  //   }
  //   //value not exists
  //   else
  //   {
  //     for (var item in _user.wishlist){
  //       newWishlist.add(item);
  //     }
  //     newWishlist.add(WishlistItemJson(productId: productId));
  //   }
  //   UserJson updatedUser = _user.copyWith(wishlist: newWishlist);
  //   //print(updatedUser.cart[0].quantity);
  //   await _userRepository.updateUser(updatedUser);
  //   _user = await _userRepository.getUser();
  //   notifyListeners();
  // }
  //
  // void getIsFavourite(String productId) {
  //   _isFav = _user.wishlist.any((element) => element.productId == productId);
  //   print('issfav ${isFav}');
  //   notifyListeners();
  //   //return isFav;
  // }

}