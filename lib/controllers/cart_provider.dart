import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/repositories/user_repository.dart';
import 'package:flutterdemo/models/cart_json.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/repositories/product_repository.dart';
import '../models/store_json.dart';
import '../models/user_json.dart';
import '../repositories/store_repository.dart';

class CartProvider with ChangeNotifier {
  CartProvider(
      this._storeRepository, this._productRepository, this._userRepository);

  final ProductRepository _productRepository;
  final UserRepository _userRepository;
  final StoreRepository _storeRepository;

  StoreJson _store = StoreJson.empty();
  UserJson _user = UserJson.empty();
  List<ProductJson> _products = [];
  List<StoreJson> _stores = [];
  int _subTotal = -1;
  int _delivery = -1;
  int _total = -1;
  bool _isCartEmpty = false;
  bool _isFetching = true;

  StoreJson get store => _store;
  List<ProductJson> get products => _products;
  List<StoreJson> get stores => _stores;
  UserJson get user => _user;
  int get subTotal => _subTotal;
  int get total => _total;
  int get delivery => _delivery;
  bool get isFetching => _isFetching;
  bool get isCartEmpty => _isCartEmpty;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> setIsFetching() async {
    _isFetching = true;
    notifyListeners();
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

  StoreJson getStore(String id) {
    StoreJson store = StoreJson.empty();
    for (var store in _stores) {
      if (id == store.id) {
        return store;
      }
    }
    return store;
  }

  Future<void> getProductsList() async {
    _products = await _productRepository.getProductList();
    notifyListeners();
  }

  Future<void> getStoresList() async {
    _stores = await _storeRepository.getStoresList();
    notifyListeners();
  }

  Future<void> setCartLength() async {
    _isCartEmpty = user.cart.isEmpty;
    notifyListeners();
  }

  Future<void> updateList(List<CartItemJson> newCart) async {
    UserJson updatedUser = _user.copyWith(cart: newCart);
    await _userRepository.updateUser(updatedUser);
    notifyListeners();
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> decrementCartItem(String productId, int quantity) async {
    List<CartItemJson> newCart = [];
    for (var item in user.cart) {
      if (item.productId == productId) {
        if (item.quantity != 1) {
          CartItemJson i = item.copyWith(
              productId: item.productId, quantity: item.quantity - 1);
          newCart.add(i);
        }
      } else {
        newCart.add(item);
      }
    }

    await updateList(newCart);
    setTotal();
    setCartLength();
    notifyListeners();
  }

  void incrementCartItem(String productId, int quantity) async {
    List<CartItemJson> newCart = [];
    for (var item in user.cart) {
      if (item.productId == productId) {
        CartItemJson i = item.copyWith(
            productId: item.productId, quantity: item.quantity + 1);
        newCart.add(i);
      } else {
        newCart.add(item);
      }
    }
    await updateList(newCart);
    setTotal();
  }

  void setTotalDeliveryCharges() {
    List<ProductJson> cartProducts = _user.cart
        .map((e) => getProductInfo(e.productId))
        .cast<ProductJson>()
        .toList();

    List<StoreJson> productStores =
        cartProducts.map((e) => getStore(e.storeId)).cast<StoreJson>().toList();

    List<StoreJson> storeDistinct = [];
    storeDistinct = productStores.toSet().toList();

    int delivery = 0;

    for (var store in storeDistinct) {
      delivery = store.deliveryCharges + delivery;
    }

    _delivery = delivery;
    notifyListeners();
  }

  void setSubTotal() {
    int subTotal = 0;
    for (var item in _user.cart) {
      for (var product in _products) {
        if (item.productId == product.id) {
          subTotal = subTotal + (item.quantity * product.price);
        }
      }
    }
    _subTotal = subTotal;
    notifyListeners();
  }

  void setTotal() {
    setSubTotal();
    notifyListeners();
    setTotalDeliveryCharges();
    notifyListeners();
    _total = _delivery + _subTotal;
    notifyListeners();
    _isFetching = false;
    notifyListeners();
  }
}
