import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/cart_model.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/repositories/product_repository.dart';
import '../models/store_model.dart';
import '../models/user_model.dart';
import '../repositories/store_repository.dart';
import 'package:get_it/get_it.dart';

class CartProvider with ChangeNotifier {

  CartProvider(this._storeRepository, this._productRepository,
      this._userRepository);

  ProductRepository _productRepository;
  UserRepository _userRepository;
  StoreRepository _storeRepository;

  StoreJson _store = const StoreJson.empty();
  UserJson _user = UserJson.empty();
  List<ProductJson> _products = [];
  List<StoreJson> _stores = [];
  int _total = -1;

  StoreJson get store => _store;
  List<ProductJson> get products => _products;
  List<StoreJson> get stores => _stores;
  UserJson get user => _user;
  int get total => _total;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
    //print('cart quantity ${_user.cart[0].quantity}');
  }

  // Future<void> getProduct(String id) async {
  //   ProductJson product = await _productRepository.getProductInfo(id);
  //   //notifyListeners();
  //   _product = product;
  //   notifyListeners();
  // }

  ProductJson getProduct(String id) {
    ProductJson product = ProductJson.empty();
      for (var product in _products) {
        print("prod,, ${product.id}");
        if(id == product.id){
          return product;
      }
    }
    return product;
  }

  StoreJson getStore(String id) {
    StoreJson store = StoreJson.empty();
    for (var store in _stores) {
      print("store,, ${store.id}");
      if(id == store.id){
        return store;
      }
    }
    return store;
  }


  Future<void> getProductsList() async {
    _products = await _productRepository.getProductList();
    notifyListeners();
    print(products);
  }

  Future<void> getStoresList() async {
    _stores = await _storeRepository.getStoresList();
    notifyListeners();
    print(stores);
    //notifyListeners();
  }

  // Future<void> getCartProductsJson() async{
  //   List<ProductJson> products = [];
  //   for (var item in _user.cart) {
  //     for (var product in _products){
  //       if(item.productId == product.id){
  //         products.add(product);
  //       }
  //     }
  //   }
  //
  // _cartProducts = products;
  //   notifyListeners();
  // }

  // StoreJson getStore(String id) async {
  //   StoreJson store = StoreJson.empty();
  //   ProductJson product = getProduct(id);
  //   store = await _storeRepository.getStoreInfo(product.storeId);
  //   notifyListeners();
  //   print(_store);
  //   return store;
  //
  // }

  Future<void> updateList(List<CartItemJson> newCart) async {
    UserJson updatedUser = _user.copyWith(cart: newCart);
    //print(updatedUser.cart[0].quantity);
    await _userRepository.updateUser(updatedUser);
    notifyListeners();
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> decrementCartItem(String productId, int quantity) async {
    //print(user.cart);
    List<CartItemJson> newCart = [];

    for (var item in user.cart){
      if (item.productId == productId){
        if (item.quantity != 1){
          CartItemJson i = item.copyWith(productId: item.productId, quantity: item.quantity - 1);
          newCart.add(i);
        }
      }
      else{
        newCart.add(item);
      }
    }
    print('newcartlength: ${newCart.length}');

    await updateList(newCart);
    setTotal();
    //print(_user.cart[0].quantity);
  }

  void incrementCartItem(String productId, int quantity) async {
    //print(user.cart);
    List<CartItemJson> newCart = [];

    for (var item in user.cart){

      if (item.productId == productId){
        //item.quantity = quantity + 1;
        //print("pID ${item.productId}");
        CartItemJson i = item.copyWith(productId: item.productId, quantity: item.quantity + 1);
        //print('item: ${i.quantity}');
        newCart.add(i);
        //print('newCart: ${newCart[0].quantity}');
      }
      else{
        newCart.add(item);
      }
    }
    //print('newcart: ${newCart[0].quantity}');

    await updateList(newCart);
    setTotal();
    //print(_user.cart[0].quantity);
  }

  void setTotal() {
    int total = 0;
    print(_user.cart.length);
    print(_products.length);
    for (var item in _user.cart) {
      print("item ,, ${item.productId}");
      for (var product in _products) {
        print("item ,, ${item.productId}");
        print("prod,, ${product.id}");
        if(item.productId == product.id){
           total = total + (item.quantity * product.price);
          print(total);
        }
      }
    }
    _total = total;
    notifyListeners();
  }

}