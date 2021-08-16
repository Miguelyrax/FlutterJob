import 'package:flutter/material.dart';
class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      border: InputBorder.none,
     
                enabledBorder: UnderlineInputBorder(
                  
                  borderSide: BorderSide(
                    color: Colors.white,
                    
                  ),
                ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                 
                )
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
              ),
              prefixIcon: prefixIcon != null 
              ? Icon(prefixIcon, color: Colors.black,)
              :null

              );
  }

}