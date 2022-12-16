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
  List<ProductJson> _products = [];
  UserJson _user = UserJson.empty();
  OrderJson _clickedOrder = OrderJson.empty();
  bool _isFetching = true;

  List<OrderJson> get orders => _orders;
  UserJson get user => _user;
  List<ProductJson> get products => _products;
  OrderJson get clickedOrder => _clickedOrder;
  bool get isFetching => _isFetching;


  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }

  List<OrderJson> getMyOrders() {
    List<OrderJson> allOrders = [];
    allOrders = _orders.where((element) => element.userId == _user.id).toList();
    _isFetching = false;
    notifyListeners();
    return allOrders;
    //notifyListeners();
  }

  Future<void> getOrderList() async {
    print('in method');
    _orders = await _orderRepository.getOrderList();
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

  void setOrder(OrderJson order){
    _clickedOrder = clickedOrder;
    notifyListeners();
  }

}