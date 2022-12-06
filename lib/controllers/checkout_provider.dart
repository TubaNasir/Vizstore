import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/cart_model.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/models/store_model.dart';
import 'package:flutterdemo/models/user_model.dart';
import 'package:flutterdemo/repositories/product_repository.dart';
import 'package:flutterdemo/repositories/store_repository.dart';

class CheckoutProvider with ChangeNotifier {
  CheckoutProvider(
      this._userRepository, this._storeRepository, this._productRepository);

  UserRepository _userRepository;
  StoreRepository _storeRepository;
  ProductRepository _productRepository;

  UserJson _user = UserJson.empty();
  StoreJson _store = StoreJson.empty();
  ProductJson _product = ProductJson.empty();
  List<ProductJson> _products = [];
  List<StoreJson> _stores = [];
  List<StoreJson> _cartStores = [];

  UserJson get user => _user;

  StoreJson get store => _store;

  List<ProductJson> get products => _products;

  List<StoreJson> get stores => _stores;

  //List<StoreJson> get cartStores => _storeDistinct;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> placeOrder(
      String name, String contact, String address, String city) async {}

  // Future<StoreJson> getStore(String id) async {
  //   _store = await _storeRepository.getStoreInfo(id);
  //   notifyListeners();
  //   print(_store);
  //   return _store;
  // }
  //
  // Future<ProductJson> getProduct(String id) async {
  //   _product = await _productRepository.getProductInfo(id);
  //   notifyListeners();
  //   return _product;
  // }

  List<StoreJson> getProductsInfo() {
    List<StoreJson> _storeDistinct = [];

    List<ProductJson> cartProducts =
        _user.cart.map((e) => getProduct(e.productId)).cast<ProductJson>().toList();

    List<StoreJson> productStores =
        cartProducts.map((e) => getStore(e.storeId)).cast<StoreJson>().toList();

    _storeDistinct = productStores.toSet().toList();
    //notifyListeners();
   return _storeDistinct;

  }

  Future<void> getProductsList() async {
    print('in method');
    _products = await _productRepository.getProductList();
    notifyListeners();
    print(products);
    //notifyListeners();
  }

  Future<void> getStoresList() async {
    print('in method');
    _stores = await _storeRepository.getStoresList();
    notifyListeners();
    print(stores);
    //notifyListeners();
  }

  ProductJson getProduct(String id) {
    ProductJson product = ProductJson.empty();
    for (var product in _products) {
      print("prod,, ${product.id}");
      if (id == product.id) {
        return product;
      }
    }
    return product;
  }

  StoreJson getStore(String id) {
    StoreJson store = StoreJson.empty();
    for (var store in _stores) {
      print("store,, ${store.id}");
      if (id == store.id) {
        return store;
      }
    }
    return store;
  }

  List<CartItemJson> getProductsFromStore(String id){
    List<CartItemJson> cartProducts = [];

    cartProducts = user.cart.where((element) => getProduct(element.productId).storeId == id).toList();

    List<ProductJson> cartProductInfo = cartProducts.map((e) => getProduct(e.productId)).toList();

    return cartProducts;

    // for (var product in cartProducts) {
    //   print("prod,, ${product.id}");
    //   if (store.id == product.storeId) {
    //     products.add(product);
    //   }
    // }
    // return products;
  }

  Future<void> getCartStores() async {
    await getUser();
    print('is being called' + user.cart.length.toString());

    _cartStores = _stores;

    //List _storeDistinct = _cartStores

    // for (var item in user.cart) {
    //   print('ch prv ' + item.quantity.toString());
    // if (!_cartStores.contains(getStore(getProduct(item.productId).storeId)))
    // {
    // _cartStores.add(getStore(getProduct(item.productId).storeId));
    // }
    //
    // }

    // user.cart.map((element) => {
    //       if (!_cartStores.contains(getStore(getProduct(element.productId).id)))
    //         {
    //           _cartStores.add(getStore(getProduct(element.productId).id))
    //         }
    //     }
    //     );
    notifyListeners();
    //return _cartStores;

  }
}
