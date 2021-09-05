

import 'package:flutter/material.dart';
import 'package:master_jobz/helpers/environment.dart';

class TextStyleDecoration {
  static TextStyle textStyleDecoration(){
    return TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold);
  }
  static TextStyle textStyleDecorationRojo(){
    return TextStyle(color: Environment.rojo, fontSize: 15, fontWeight: FontWeight.bold);
  }
}