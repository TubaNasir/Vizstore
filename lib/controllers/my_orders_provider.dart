import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/core/user_repository.dart';
import 'package:flutterdemo/models/order_model.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/models/user_model.dart';
import 'package:flutterdemo/repositories/order_repository.dart';
import 'package:flutterdemo/repositories/product_repository.dart';

class MyOrdersProvider with ChangeNotifier {

  MyOrdersProvider(this._userRepository, this._orderRepository, this._productRepository);

  UserRepository _userRepository;
  OrderRepository _orderRepository;
  ProductRepository _productRepository;

  List<OrderJson> _orders = [];
  List<OrderJson> _myOrders = [];
  List<ProductJson> _products = [];
  UserJson _user = UserJson.empty();
  OrderJson _clickedOrder = OrderJson.empty();
  bool _isOrdersEmpty = false;
  bool _isFetching = true;

  List<OrderJson> get orders => _orders;
  List<OrderJson> get myOrders => _myOrders;
  UserJson get user => _user;
  List<ProductJson> get products => _products;
  OrderJson get clickedOrder => _clickedOrder;
  bool get isFetching => _isFetching;
  bool get isOrderEmpty => _isOrdersEmpty;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> getMyOrders() async {
    List<OrderJson> allOrders = [];
    allOrders = _orders.where((element) => element.userId == _user.id).toList();
    _myOrders = allOrders;
    notifyListeners();
    //notifyListeners();
  }

  Future<void> setIsFetching() async {
    _isFetching = true;
    notifyListeners();
  }

  Future<void> getOrderList() async {
    print('in method');
    _orders = await _orderRepository.getOrderList();
    notifyListeners();
    _isFetching = false;
    notifyListeners();
    print(orders);

    //notifyListeners();
  }

  Future<void> getProductsList() async {
    print('in method');
    _products = await _productRepository.getProductList();
    notifyListeners();
    print(products);
    //notifyListeners();
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

  void setOrder(OrderJson order){
    _clickedOrder = clickedOrder;
    notifyListeners();
  }

}