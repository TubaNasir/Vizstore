import 'package:flutter/material.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/repositories/product_repository.dart';

class SearchProvider with ChangeNotifier {
  SearchProvider(this._productRepository);

  ProductRepository _productRepository;

  String _searchText = '';
  List<ProductJson> _products = [];
  List<ProductJson> _categoryProducts = [];
  List<ProductJson> _filteredProducts = [];

  List<ProductJson> get products => _products;

  List<ProductJson> get categoryProducts => _categoryProducts;

  List<ProductJson> get filteredProducts => _filteredProducts;

  String get searchText => _searchText;

  Future<void> getProductsList() async {
    print('in method');
    _products = await _productRepository.getProductList();
    notifyListeners();
    print('search' + products[0].category);
    //notifyListeners();
  }

  void getCategoryProducts(String category) async {
    //await getProductsList();
    print('ctg' + category);
    _categoryProducts =
        products.where((element) => element.category == category).toList();
    notifyListeners();
  }

  void getFilteredProducts() {
    _filteredProducts = products
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()) ||
            element.description
                .toLowerCase()
                .contains(searchText.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void setSearchItem(String text) {
    _searchText = text;
    notifyListeners();
  }
}
