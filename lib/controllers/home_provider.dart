import 'package:flutter/material.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/repositories/product_repository.dart';
import '../models/store_model.dart';
import '../repositories/store_repository.dart';
import 'package:get_it/get_it.dart';

class HomeProvider with ChangeNotifier{

  HomeProvider(this._storeRepository, this._productRepository);

  StoreRepository _storeRepository;
  ProductRepository _productRepository;

  StoreJson _store = const StoreJson.empty();
  List<Product> _products = [];

  StoreJson get store => _store;
  List<Product> get products => _products;

  void getStore(String id) async {
    _store = await _storeRepository.getStoreInfo(id);
    notifyListeners();
    print(_store);
  }

  void getProductsList() async {
    print('in method');
    _products = await _productRepository.getProductList();
    notifyListeners();
    print(products);
    //notifyListeners();
  }
}