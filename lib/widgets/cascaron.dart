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
    padding: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          spreadRadius: 0.2,
          offset: Offset(0,5)
        )],
      borderRadius: BorderRadius.circular(5)
    ),
  child: this.child,
        );
  }
}