import 'package:flutter/material.dart';
import '../models/store_model.dart';
import '../repositories/store_repository.dart';

class StoreProvider with ChangeNotifier{

  StoreProvider(this.storeRepository);

  StoreRepository storeRepository;

  StoreJson _store = const StoreJson.empty();

  StoreJson get store => _store;

  void getStore(String id) async {
    _store = await storeRepository.getStoreInfo(id);
    notifyListeners();
    print(_store);
    //notifyListeners();
  }
}