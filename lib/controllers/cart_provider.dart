import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
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
  ProductJson _product = const ProductJson.empty();
  UserJson _user = UserJson.empty();
  List<ProductJson> _products = [];

  StoreJson get store => _store;
  ProductJson get product => _product;

  List<ProductJson> get products => _products;

  UserJson get user => _user;

  void getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
    print('prov' + _user.firstName);
  }

  void getProduct(String id) async {
    _product = await _productRepository.getProductInfo(id);
    notifyListeners();
    print(_product);
  }

  void getProductsList() async {
    print('in method');
    _products = await _productRepository.getProductList();
    notifyListeners();
    print(products);
    //notifyListeners();
  }

  void getStore(String id) async {
    _store = await _storeRepository.getStoreInfo(id);
    notifyListeners();
    print(_store);
  }

}