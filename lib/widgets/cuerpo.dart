import 'package:flutter/material.dart';
class Pad extends StatelessWidget {
  final Widget child;
  final bool title;
  const Pad({
    Key? key,required this.child, this.title = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: this.title ? Colors.white : Colors.black.withOpacity(0.05),
      child: this.child);
  }
}