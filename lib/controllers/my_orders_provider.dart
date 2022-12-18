import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/domain/user_repository.dart';
import 'package:flutterdemo/models/order_json.dart';
import 'package:flutterdemo/models/product_json.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/repositories/firebase_order_repository.dart';
import 'package:flutterdemo/repositories/firebase_product_repository.dart';

class MyOrdersProvider with ChangeNotifier {

  MyOrdersProvider(this._userRepository, this._orderRepository, this._productRepository);

  UserRepository _userRepository;
  FirebaseOrderRepository _orderRepository;
  FirebaseProductRepository _productRepository;

  List<OrderJson> _orders = [];
  List<OrderJson> _myOrders = [];
  List<ProductJson> _products = [];
  UserJson _user = UserJson.empty();
  OrderJson _clickedOrder = OrderJson.empty();
  bool _isOrderEmpty = false;
  bool _isFetching = true;

  List<OrderJson> get orders => _orders;
  List<OrderJson> get myOrders => _myOrders;
  UserJson get user => _user;
  List<ProductJson> get products => _products;
  OrderJson get clickedOrder => _clickedOrder;
  bool get isFetching => _isFetching;
  bool get isOrderEmpty => _isOrderEmpty;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  Future<void> setOrderLength() async{
    _isOrderEmpty = _myOrders.isEmpty;
    notifyListeners();
  }

  Future<void> getMyOrders() async {
    List<OrderJson> allOrders = [];
    allOrders = _orders.where((element) => element.userId == _user.id).toList();
    _myOrders = allOrders;
    notifyListeners();
  }

  Future<void> setIsFetchingTrue() async {
    _isFetching = true;
    notifyListeners();
  }

  Future<void> setIsFetchingFalse() async {
    _isFetching = false;
    notifyListeners();
  }

  Future<void> getOrderList() async {
    _orders = await _orderRepository.getOrderList();
    notifyListeners();
    _isFetching = false;
    notifyListeners();
  }

  Future<void> getProductsList() async {
    _products = await _productRepository.getProductList();
    notifyListeners();
  }

  void setOrder(OrderJson order){
    _clickedOrder = clickedOrder;
    notifyListeners();
  }

}