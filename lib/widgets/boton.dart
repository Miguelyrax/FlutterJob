import 'package:flutter/material.dart';
import 'package:master_jobz/helpers/environment.dart';
class Boton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final Color? color ;
   Boton({
    Key? key,required  this.text, required this.onPressed, this.color ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
                child: MaterialButton(onPressed: this.onPressed == null ? null : ()=>onPressed!(),
                disabledColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                color: this.color == null ? Environment.negro : this.color,
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                child:  Text(this.text,style: TextStyle(fontSize: 20, color:this.color == null ? Colors.white:Colors.black.withOpacity(0.8)))
                ),
              );
  }
}