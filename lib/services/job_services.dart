

import 'package:flutter/material.dart';

class JobServices with ChangeNotifier{

  GlobalKey key = new GlobalKey();
  bool _isLoading = false;
  String title = '';
  String subTitle = '';
  String description = '';
  int totalRequerido = 100;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

}