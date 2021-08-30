
import 'package:flutter/material.dart';
import 'package:master_jobz/helpers/environment.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/widgets/boton.dart';

import 'package:provider/provider.dart';

void alertOk(BuildContext context, bool success, String title,){
  showDialog(context: context, builder: (context)=>AlertDialog(
    actions: [
      success
      ? Boton(text: 'Volver', onPressed: ()=>Navigator.pushReplacementNamed(context, 'jobs'))
      : Boton(text: 'Cerrar', onPressed: ()=>Navigator.pop(context))
     
    ],
    content: SingleChildScrollView(
      child: Column(
        children: [
          success
          ? Icon(Icons.done, color: Colors.green, size: 40,)
          : Icon(Icons.cancel, color: Colors.red, size: 60,),
          
          SizedBox(height: 10,),
          success
          ? Text('Genial!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          : Text('Error', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text(title),
          SizedBox(height: 10,),
          
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
void editContacto(BuildContext context, Widget child ){
  showDialog(barrierDismissible: true,context: context, builder: ( context) => AlertDialog(
    content: SingleChildScrollView(
      child: child
    ),
  ));
}
void loading(BuildContext context){
  showDialog(
    barrierColor: Colors.white.withOpacity(0.3),
    barrierDismissible: false,context: context, builder: ( context) => AlertDialog(
      elevation: 0,
    backgroundColor: Colors.transparent,
    contentPadding: EdgeInsets.zero,
    content: SingleChildScrollView(

      child: Center(
          child: Transform.scale(
            scale: 1.5,
            child: CircularProgressIndicator(
              color: Environment.rojo,
              strokeWidth: 6,
            ),
          ),
        ),
    ),
  ));
}

void alertEliminar(BuildContext context, Function onPressed ){
  showDialog(barrierDismissible: true,context: context, builder: ( context) => AlertDialog(
    actions: [
      Boton(text: 'Eliminar', onPressed: ()=>onPressed()),
      SizedBox(height: 10,),
      Boton(text: 'Cancelar', onPressed: ()=>Navigator.pop(context)),
    ],
    content: SingleChildScrollView(
      child: Column(
        children: [
          Icon(Icons.cancel, color: Colors.red, size: 60,),
          Text('Eliminar', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
          Text('¿Esta seguro?'),
          Text('Esta accion es irreversible'),
        ],
      )
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
