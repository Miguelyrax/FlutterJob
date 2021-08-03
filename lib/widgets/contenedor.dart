import 'package:flutter/material.dart';
class Contenedor extends StatelessWidget {
  final Widget child;
  const Contenedor({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 9,
            spreadRadius: 0.9,
            offset: Offset(0,2)
          )]
        ),
        child: this.child,
      ),
    );
  }
}
