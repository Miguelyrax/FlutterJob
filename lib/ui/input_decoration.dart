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
  static InputDecoration editRequerimiento() {
    return InputDecoration(
      border: InputBorder.none,
     
                enabledBorder: UnderlineInputBorder(
                  
                  borderSide: BorderSide(
                    color: Colors.black12,
                    
                  ),
                ),
               
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black12,
                 
                )
              ),
              
        
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
              ),
            

              );
  }
  static InputDecoration editJobDecoration({
    String? hint,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      border: InputBorder.none,
     
                enabledBorder: InputBorder.none,
              
                focusColor: Colors.red,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
              ),
              prefixIcon: prefixIcon != null 
              ? Icon(prefixIcon, color: Colors.black,)
              :null,
              hintText: hint != null ? hint : '',
              );

              
  }
  static InputDecoration edicionesDecoration({

    IconData? prefixIcon,
  }) {
    return InputDecoration(
      border: InputBorder.none,
     
                enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                focusColor: Colors.red,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
              ),
              hintText: 'Añadir Habilidad',
              

              );
  }

}