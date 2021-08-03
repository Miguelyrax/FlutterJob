
import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/widgets/boton.dart';
import 'package:provider/provider.dart';

void alertOk(BuildContext context){
  showDialog(context: context, builder: (context)=>AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        children: [
          Text('Genial'),
          Text('Has postulado al siguiente cargo'),
        ],
      ),
    ),  
  ));
}

void alertError(BuildContext context){
  showDialog(context: context, builder: (context)=>AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        children: [
          Text('Error'),
          Text('Para postular se requiere el 100% de los requisitos'),
        ],
      ),
    ),  
  ));
}

void editAlert(BuildContext context, TextEditingController controller){
  final jobProvider = Provider.of<JobProvider>(context, listen: false);
  showDialog(barrierDismissible: true,context: context, builder: ( context) => AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        children: [
          Text('Requerimiento', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          TextFormField(
            controller: controller,
          ),
          SizedBox(height: 20,),
          
              Boton(text: 'Guardar', onPressed: ()async{
                final resp = await jobProvider.newRequerimiento(jobProvider.job!.id, controller.text);
                if(resp){
                  Navigator.pop(context);
                }
              }),
          
        ],
      ),
    ),
  ));
}
void editReqAlert(BuildContext context, TextEditingController controller, String id){
  final jobProvider = Provider.of<JobProvider>(context, listen: false);
  showDialog(barrierDismissible: true,context: context, builder: ( context) => AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        children: [
          Text('Requisito', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          TextFormField(
            controller: controller,
          ),
          SizedBox(height: 20,),
          
              Boton(text: 'Guardar', onPressed: ()async{
                final resp = await jobProvider.newRequisito(id, controller.text);
                if(resp){
                  Navigator.pop(context);
                }
              }),
          
        ],
      ),
    ),
  ));
}
