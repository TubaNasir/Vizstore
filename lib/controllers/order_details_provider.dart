import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/models/store_json.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/repositories/firebase_product_repository.dart';
import 'package:flutterdemo/repositories/firebase_store_repository.dart';

class OrderDetailsProvider with ChangeNotifier {

  OrderDetailsProvider(this._productRepository, this._userRepository, this._storeRepository);

  ProductRepository _productRepository;
  UserRepository _userRepository;
  final StoreRepository _storeRepository;

  List<ProductJson> _products = [];
  UserJson _user = UserJson.empty();
  StoreJson _store = const StoreJson.empty();
  ProductJson _product = ProductJson.empty();
  bool _isFetching = true;

  List<ProductJson> get products => _products;
  ProductJson get product => _product;
  UserJson get user => _user;
  StoreJson get store => _store;
  bool get isFetching => _isFetching;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> getProductsList() async {
    _products = await _productRepository.getProductList();
    notifyListeners();
  }

  Future<void> getProductInfo(String id) async {
    ProductJson prod = ProductJson.empty();
    for (var product in _products) {
      if (id == product.id) {
        prod = product;
      }
    }

    _product = prod;
    notifyListeners();

  }

  Future<void> setIsFetchingTrue() async {
    _isFetching = true;
    notifyListeners();
  }

  Future<void> setIsFetchingFalse() async {
    _isFetching = false;
    notifyListeners();
  }

  Future<void> getStore(String id) async {
    _store = await _storeRepository.getStoreInfo(id);
    notifyListeners();
  }
}