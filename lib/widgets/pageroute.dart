import 'package:flutter/material.dart';
PageRouteBuilder<dynamic> ruta(Widget child, Offset offset, bool fast) {
    return PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)=>child,
                   transitionDuration: Duration(milliseconds: 600),
                   reverseTransitionDuration: fast ? Duration(milliseconds: 500):Duration(milliseconds: 900),
                   transitionsBuilder: (context, animation, secondaryAnimation, child){
                     final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
                     return SlideTransition(position: Tween<Offset>(begin: offset, end: Offset.zero).animate(curvedAnimation),
                     child: child,);
    },
  );
  }