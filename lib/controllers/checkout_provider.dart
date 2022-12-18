import 'package:flutter/material.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/cart_json.dart';
import 'package:flutterdemo/models/order_json.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/models/store_json.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/repositories/firebase_order_repository.dart';
import 'package:flutterdemo/repositories/firebase_product_repository.dart';
import 'package:flutterdemo/repositories/firebase_store_repository.dart';

class CheckoutProvider with ChangeNotifier {
  CheckoutProvider(this._userRepository, this._storeRepository,
      this._productRepository, this._orderRepository);

  UserRepository _userRepository;
  StoreRepository _storeRepository;
  ProductRepository _productRepository;
  OrderRepository _orderRepository;

  UserJson _user = UserJson.empty();
  StoreJson _store = StoreJson.empty();
  List<ProductJson> _products = [];
  List<StoreJson> _stores = [];
  List<CartItemJson> _storeProducts = [];
  String _address = '';
  String _city = '';
  int _total = 0;

  int get total => _total;

  UserJson get user => _user;

  StoreJson get store => _store;

  List<ProductJson> get products => _products;

  List<StoreJson> get stores => _stores;

  List<CartItemJson> get storeProducts => _storeProducts;

  String get address => _address;

  String get city => _city;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> placeOrder() async {
    DateTime date = DateTime.now();
    List<StoreJson> distinctStores = getProductsInfo();
    List<OrderJson> orders = [];

    for (var element in distinctStores) {
      int total = setSubtotalWithDelivery(element);
      orders.add(OrderJson(
          userId: _user.id,
          cart: getProductsFromStore(element.id),
          date_created: date,
          city: _city,
          address: _address,
          total: total));
    }

    orders.forEach((element) async {
      await placeOrder2(element);
    });
  }

  Future<void> placeOrder2(OrderJson order) async {
    await _orderRepository.addOrder(order);
    for (var e in order.cart) {
      updateProduct(getProduct(e.productId), e.quantity);
    }

    updateUser(_user);
  }

  void setTotal() {
    int total = 0;
    for (var item in _user.cart) {
      for (var product in _products) {
        if (item.productId == product.id) {
          total = total + (item.quantity * product.price);
        }
      }
    }
    _total = total;

    List<StoreJson> storeDistinct = getProductsInfo();
    for (var e in storeDistinct) {
      _total += e.deliveryCharges;
    }

    notifyListeners();
  }

  void setAddress(String address) {
    _address = address;
  }

  void setCity(String city) {
    _city = city;
  }

  List<StoreJson> getProductsInfo() {
    List<StoreJson> _storeDistinct = [];

    List<ProductJson> cartProducts = _user.cart
        .map((e) => getProduct(e.productId))
        .cast<ProductJson>()
        .toList();

    List<StoreJson> productStores =
        cartProducts.map((e) => getStore(e.storeId)).cast<StoreJson>().toList();

    _storeDistinct = productStores.toSet().toList();

    return _storeDistinct;
  }

  Future<void> getProductsList() async {
    _products = await _productRepository.getProductList();
    notifyListeners();
  }

  Future<void> getStoresList() async {
    _stores = await _storeRepository.getStoresList();
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

  StoreJson getStore(String id) {
    StoreJson store = StoreJson.empty();
    for (var store in _stores) {
      if (id == store.id) {
        return store;
      }
    }
    return store;
  }

  List<CartItemJson> getProductsFromStore(String id) {
    List<CartItemJson> cartProducts = [];

    cartProducts = user.cart
        .where((element) => getProduct(element.productId).storeId == id)
        .toList();

    return cartProducts;
  }

  int setSubtotalWithDelivery(StoreJson store) {
    List<CartItemJson> cartProducts = getProductsFromStore(store.id);
    int subtotal = 0;
    for (var element in cartProducts) {
      subtotal += (getProduct(element.productId).price * element.quantity);
    }
    subtotal += store.deliveryCharges;

    return subtotal;
  }

  updateProduct(ProductJson product, int quantity) async {
    ProductJson newProduct = product.copyWith(
        sold: product.sold + quantity, stock: product.stock - quantity);
    await _productRepository.updateProduct(newProduct);
  }

  updateUser(UserJson user) async {
    List<CartItemJson> emptyCart = [];
    UserJson updatedUser = user.copyWith(cart: emptyCart);

    await _userRepository.updateUser(updatedUser);
  }
}
