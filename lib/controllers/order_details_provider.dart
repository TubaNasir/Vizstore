import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/repositories/product_repository.dart';

class OrderDetailsProvider with ChangeNotifier {

  OrderDetailsProvider(this._productRepository);

  ProductRepository _productRepository;

  List<ProductJson> _products = [];

  List<ProductJson> get products => _products;

  Future<void> getProductsList() async {
    print('in method');
    _products = await _productRepository.getProductList();
    notifyListeners();
    print(products);
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
}