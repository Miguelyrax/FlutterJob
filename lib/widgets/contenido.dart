import 'package:flutter/material.dart';
class Contenido extends StatelessWidget {
  final Widget child;
  const Contenido({
    Key? key,
    required this.child,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 20,
          spreadRadius: 9,
          offset: Offset(0,5)
        )]
      ),
      child: this.child,
    );
  }
}