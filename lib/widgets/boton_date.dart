import 'package:flutter/material.dart';
class BotonDate extends StatelessWidget {
  const BotonDate({
    Key? key,
    required this.value,required this.funcion,
  }) : super(key: key);

  final DateTime value;
  final Function funcion;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: () async {
               final result = await showDatePicker(
                 currentDate: value,
                   context: context,
                   initialDate: value,
                   firstDate: DateTime(2010),
                   lastDate: DateTime(2024));
                   if(result != null){
                     funcion(result);
                   }
             },
             child:Container(
               child: Row(
                 children: [
                   Text('${value.day}-${value.month}-${value.year}'),
                   Icon(Icons.date_range)
                 ],
               ),
             ) 
             ,);
  }
}