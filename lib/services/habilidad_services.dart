

import 'package:flutter/material.dart';

class HabilidadServices with ChangeNotifier{
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  bool _isLoading = false;
  String habilidad = '';
  String requerimiento = '';
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }
   bool isValidForm(){

    return formKey.currentState?.validate() ?? false;

  }

}