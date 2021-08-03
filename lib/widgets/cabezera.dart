
import 'package:flutter/material.dart';
import 'package:master_jobz/models/usuario.dart';
class Cabezera extends StatelessWidget {
  final String user;

  const Cabezera({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.15,
          color: Color(0xff0F1225),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
          margin: EdgeInsets.only(top: size.height*0.07),
          width: size.width * 0.3,
          height: size.width * 0.3,
          decoration: BoxDecoration(
            color: Color(0xff0F1225),
            border: Border.all(color: Color(0xff75F39F), width: 4),
            borderRadius: BorderRadius.circular(200)
          ),
          child: Center(child: Text('${this.user.substring(0,2).toUpperCase()}', style: TextStyle(fontSize: 30, color: Color(0xff75F39F), fontWeight: FontWeight.bold),),),
              ),
        ),
      ],
    );
  }
}