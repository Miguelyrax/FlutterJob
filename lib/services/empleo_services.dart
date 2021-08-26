

import 'package:flutter/material.dart';

class EmpleoProvider with ChangeNotifier {

    GlobalKey<FormState> formKey = new GlobalKey<FormState>();

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