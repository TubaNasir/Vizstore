import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/repositories/product_repository.dart';
import '../models/store_model.dart';
import '../models/user_model.dart';
import '../repositories/store_repository.dart';
import 'package:get_it/get_it.dart';

class HomeProvider with ChangeNotifier {

  HomeProvider(this._storeRepository, this._productRepository,
      this._userRepository);

  StoreRepository _storeRepository;
  ProductRepository _productRepository;
  UserRepository _userRepository;

  StoreJson _store = const StoreJson.empty();
  UserJson _user = UserJson.empty();
  List<Product> _products = [];
  List<Product> _categoryProducts  = [];


  StoreJson get store => _store;
  List<Product> get products => _products;
  UserJson get user => _user;
  List<Product> get categoryProducts => _categoryProducts;



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


  void getProductsList() async {
    print('in method');
    _products = await _productRepository.getProductList();
    notifyListeners();
    print(products[0].category);
    //notifyListeners();
  }





}