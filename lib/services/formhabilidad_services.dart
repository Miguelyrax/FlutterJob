

import 'package:flutter/material.dart';

class FormHabilidadProvider with ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String habilidad = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    this._isLoading = value;
    notifyListeners();
  }

  bool isValidForm(){

    return formKey.currentState?.validate() ?? false;

  }


}