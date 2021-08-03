import 'package:flutter/material.dart';
class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Box(size: size),
          Align(alignment: Alignment.topCenter ,child: Icono(size: size)),
          this.child
        ],
      ),
    );
  }
}

class Icono extends StatelessWidget {
  const Icono({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          color: Color(0xff0F1225),
          borderRadius: BorderRadius.circular(200),
          border: Border.all(color:Color(0xff65E9A1), width: 5 )
        ),
        child: Center(child: Text('MZ',style: TextStyle(color: Color(0xff65E9A1), fontSize: 50, fontWeight: FontWeight.bold),),),
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        color: Color(0xff0F1225),
      ),
    );
  }
}