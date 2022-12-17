import 'package:flutter/material.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/repositories/product_repository.dart';

class StoreProvider with ChangeNotifier {

  StoreProvider(this._productRepository);

  ProductRepository _productRepository;
  List<ProductJson> _products = [];
  List<ProductJson> _storeProducts = [];

  List<ProductJson> get products => _products;
  List<ProductJson> get storeProducts => _storeProducts;

  Future<void> getProductsList() async {
    _products = await _productRepository.getProductList();
    notifyListeners();
  }

  ProductJson getProduct(String id) {
    ProductJson product = ProductJson.empty();
    for (var product in _products) {
      if (id == product.id) {
        return product;
      }
    }
    return product;
  }

  void getProductsFromStore(String id) {
    List<ProductJson> list = _products.where((element) => getProduct(element.id).storeId == id).toList();
    print('in get products from store');
    _storeProducts = list;
    notifyListeners();
  }
}