import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {


   final Widget child;
   CustomTextFormField({
    Key? key,required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45, width: 3),
        borderRadius: BorderRadius.circular(5)
      ),
      child: this.child
    );
  }
}