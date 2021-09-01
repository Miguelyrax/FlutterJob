

import 'package:flutter/material.dart';

class EducacionProvider with ChangeNotifier {

    GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String establecimiento = '';
  String tema = '';
  DateTime inicio = DateTime.now();
  DateTime termino = DateTime.now();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    this._isLoading = value;
    notifyListeners();
  }
   set setInicio(DateTime value){
    this.inicio = value;
    notifyListeners();
  }
  set setFinal(DateTime value){
    this.termino = value;
    notifyListeners();
  }

  bool isValidForm(){

    return formKey.currentState?.validate() ?? false;

  }


}