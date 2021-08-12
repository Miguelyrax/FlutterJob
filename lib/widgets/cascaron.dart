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
      color: Colors.black12.withOpacity(0.05),
      border: Border.all(color: Colors.black12, width: 1),
      borderRadius: BorderRadius.circular(5)
    ),
  child: this.child,
        );
  }
}