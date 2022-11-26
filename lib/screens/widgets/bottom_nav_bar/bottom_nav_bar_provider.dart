import 'package:flutter/foundation.dart';
import 'package:flutterdemo/screens/constants.dart';

class NavBar with ChangeNotifier {
  String _page = navBarPages[0];

  String get page => _page;

  void setPage(String page) {
    _page = page;
    notifyListeners();
  }
}