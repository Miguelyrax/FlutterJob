import 'package:flutter/material.dart';
class Cascaron extends StatelessWidget {
  const Cascaron({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xff0F1225), width: 3),
      borderRadius: BorderRadius.circular(15)
    ),
  child: this.child,
        );
  }
}