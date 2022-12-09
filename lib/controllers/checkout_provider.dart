import 'package:flutter/material.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/cart_model.dart';
import 'package:flutterdemo/models/order_model.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/models/store_model.dart';
import 'package:flutterdemo/models/user_model.dart';
import 'package:flutterdemo/repositories/order_repository.dart';
import 'package:flutterdemo/repositories/product_repository.dart';
import 'package:flutterdemo/repositories/store_repository.dart';

class CheckoutProvider with ChangeNotifier {
  CheckoutProvider(this._userRepository, this._storeRepository,
      this._productRepository, this._orderRepository);

  UserRepository _userRepository;
  StoreRepository _storeRepository;
  ProductRepository _productRepository;
  OrderRepository _orderRepository;

  UserJson _user = UserJson.empty();
  StoreJson _store = StoreJson.empty();
  ProductJson _product = ProductJson.empty();
  List<ProductJson> _products = [];
  List<StoreJson> _stores = [];
  List<StoreJson> _cartStores = [];
  String _address = '';
  String _city = '';
  int _total = 0;

  int get total => _total;
  UserJson get user => _user;
  StoreJson get store => _store;
  List<ProductJson> get products => _products;
  List<StoreJson> get stores => _stores;
  String get address => _address;
  String get city => _city;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<String> placeOrder() async {
    print('in place order ' + _city + ' ' + _address);
    if(_address == '') {
      print('Please enter a valid address');
      return 'Please enter a valid address';
    }
    else {
      DateTime date = DateTime.now();
      List<StoreJson> distinctStores = getProductsInfo();
      bool error = false;
      //print(distinctStores.map((e) => e.storeName));
      List<OrderJson> orders = distinctStores
          .map((e) =>
          OrderJson(
              userId: _user.id,
              cart: getProductsFromStore(e.id),
              date_created: date,
              city: _city,
              address: _address))
          .cast<OrderJson>()
          .toList();
      print(orders);
      //print(orders.map((e) => e.cart.first.quantity));
      // orders.map((e) async => await placeOrder2(e));
      orders.forEach((element) async {
        await placeOrder2(element);
      });
    }
    return '';

    //return error;
  }

  Future<void> placeOrder2(OrderJson order) async {
    print('in place order 2');
    await _orderRepository.addOrder(order);
    for (var e in order.cart) {
      updateProduct(getProduct(e.productId), e.quantity);
    }

    updateUser(_user);

  }

  void setTotal()  {
    int total = 0;
    print(_user.cart.length);
    print(_products.length);
    for (var item in _user.cart) {
      print("item ,, ${item.productId}");
      for (var product in _products) {
        print("item ,, ${item.productId}");
        print("prod,, ${product.id}");
        if (item.productId == product.id) {
          total = total + (item.quantity * product.price);
          print(total);
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
    //notifyListeners();
    print('ad ' + _address);
  }

  void setCity(String city) {
    _city = city;
    //notifyListeners();
    print('city ' + _city);
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

  List<CartItemJson> getProductsFromStore(String id) {
    List<CartItemJson> cartProducts = [];

    cartProducts = user.cart
        .where((element) => getProduct(element.productId).storeId == id)
        .toList();

    List<ProductJson> cartProductInfo =
        cartProducts.map((e) => getProduct(e.productId)).toList();

    print('in get products from store');
    return cartProducts;
   }

   updateProduct(ProductJson product, int quantity) async {
    ProductJson  newProduct = product.copyWith(sold: product.sold+quantity, stock: product.stock-quantity);
     await _productRepository.updateProduct(newProduct);
   }

   updateUser(UserJson user) async {
     List<CartItemJson> emptyCart = [];
     UserJson updatedUser = user.copyWith(cart: emptyCart);

     await _userRepository.updateUser(updatedUser);
   }

  }
