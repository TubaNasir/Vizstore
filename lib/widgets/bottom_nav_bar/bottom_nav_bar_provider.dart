import 'package:flutter/foundation.dart';

class NavBar with ChangeNotifier {
  String _page = 'home';

  String get page => _page;

  void setPage(String page) {
    _page = page;
    notifyListeners();
  }
}