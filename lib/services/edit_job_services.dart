

import 'package:flutter/material.dart';

class EditJobServices with ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
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
   bool isValidForm(){

    return formKey.currentState?.validate() ?? false;

  }


}