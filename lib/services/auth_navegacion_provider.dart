

import 'package:flutter/material.dart';

class AuthNavegacionProvider with ChangeNotifier{


 
  PageController _pageController =new PageController();

  set paginaActual(int value){
    _pageController.animateToPage(value, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
    notifyListeners();
  }

  PageController get pageController => this._pageController;

}