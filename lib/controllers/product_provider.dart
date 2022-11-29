import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../repositories/product_repository.dart';

class ProductProvider with ChangeNotifier{
  final ProductRepository _productRepository = ProductRepository();

  List<Product> _products = [];

  List<Product> get products => _products;

  void getProductsList() async {
    print('in method');
    _products = await _productRepository.getProductList();
    notifyListeners();
    print(products);
    //notifyListeners();
  }
}