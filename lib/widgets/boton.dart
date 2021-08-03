import 'package:flutter/material.dart';
class Boton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  const Boton({
    Key? key,required  this.text, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
                child: MaterialButton(onPressed: this.onPressed == null ? null : ()=>onPressed!(),
                disabledColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Color(0xff0F1225),
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                child:  Text(this.text,style: TextStyle(fontSize: 25, color: Color(0xff75F39F)))
                ),
              );
  }
}