import 'package:flutter/material.dart';
class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      border: InputBorder.none,
              //   enabledBorder: UnderlineInputBorder(
              //     borderSide: BorderSide(
              //       color: Color(0xff65E9A1),
              //     ),
              //   ),
              // focusedBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Color(0xff65E9A1),
              //     width: 2
              //   )
              // ),
              hintText: hintText,
              labelText: labelText,
              labelStyle: TextStyle(
                color: Colors.grey
              ),
              prefixIcon: prefixIcon != null 
              ? Icon(prefixIcon, color: Color(0xff65E9A1),)
              :null

              );
  }

}