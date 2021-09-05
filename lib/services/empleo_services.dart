

import 'package:flutter/material.dart';

class EmpleoProvider with ChangeNotifier {

    GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String empresa = '';
  String cargo = '';
  String descripcion = '';
   String msg = '';
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
    if(inicio.isAfter(termino)){
      msg = 'Valide las fechas';
      notifyListeners();
      return false;
    }
    msg = '';
    notifyListeners();
    return formKey.currentState?.validate() ?? false;

  }


}