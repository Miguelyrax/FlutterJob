
import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:provider/provider.dart';
class Cabezera extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<Auth>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.15,
          decoration: BoxDecoration(
            color: Color(0xffF5CB39),
            boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0,2)
            )]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.keyboard_backspace, size: 40,)),
                IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.menu, size: 40,)),
                
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
          margin: EdgeInsets.only(top: size.height*0.07),
          width: size.width * 0.3,
          height: size.width * 0.3,
          decoration: BoxDecoration(
            color: Color(0xffF5CB39),
            border: Border.all(color: Colors.black, width: 4),
            borderRadius: BorderRadius.circular(200)
          ),
          child: Center(child: Text('${user.usuario!.nombre.substring(0,2).toUpperCase()}', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),),),
              ),
        ),
      ],
    );
  }
}