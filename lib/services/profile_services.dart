import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {

    GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String nombre = '';
  String apellido = '';
  String user = '';
  String email = '';
  String password = '';
  String profesion = '';
  String telefono = '';
    
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