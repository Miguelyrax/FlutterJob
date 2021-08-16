import 'package:flutter/material.dart';

class NavegacionModel with ChangeNotifier{
  int _valorActual = 0;
  PageController _pageController =new PageController();
  int get paginaActual => this._valorActual;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  set paginaActual(int value){
    _valorActual = value;
    _pageController.animateToPage(value, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}