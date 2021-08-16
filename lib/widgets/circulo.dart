import 'package:flutter/material.dart';
class Circulo extends StatelessWidget {
  final IconData icon;
  final double width;
  final Function onPressed;

  const Circulo({Key? key, required this.onPressed, this.icon = Icons.add, this.width = 50}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onPressed(),
      child: Container(
        width: this.width,
        height: this.width,
        decoration: BoxDecoration(
          color: Color(0xff0F1225),
          borderRadius: BorderRadius.circular(200),
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0,2)
          )]
        ),
        child: Center(child: Icon(this.icon, color: Colors.white,)),
      ),
    );
  }
}