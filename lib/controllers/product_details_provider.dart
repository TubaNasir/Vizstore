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

class ProductDetailsProvider with ChangeNotifier {

  ProductDetailsProvider(this._storeRepository,
      this._userRepository);

  StoreRepository _storeRepository;
  UserRepository _userRepository;

  StoreJson _store = const StoreJson.empty();
  UserJson _user = UserJson.empty();
  int _quantity = 1;
  List<ProductJson> _products = [];

  StoreJson get store => _store;

  List<ProductJson> get products => _products;

  UserJson get user => _user;

  int get quantity => _quantity;

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
      }
  }

  Future<void> updateList(List<CartItemJson> newCart) async {
    UserJson updatedUser = _user.copyWith(cart: newCart);
    //print(updatedUser.cart[0].quantity);
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

  resetQuantity() {
    _quantity = 1;
    notifyListeners();
  }

}