import 'package:flutter/foundation.dart';

class NavBarStore with ChangeNotifier {
  String _page = 'products';

  String get page => _page;

  void setPage(String page) {
    _page = page;
    notifyListeners();
  }
}