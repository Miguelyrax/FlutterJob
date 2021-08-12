import 'package:flutter/material.dart';
import 'package:master_jobz/models/empleo.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/services/profile_services.dart';
import 'package:master_jobz/ui/input_decoration.dart';
import 'package:provider/provider.dart';

import 'boton.dart';
import 'cascaron.dart';
class Formulario extends StatelessWidget {

  const Formulario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final profileServices = Provider.of<ProfileProvider>(context); 
  final authProvider = Provider.of<Auth>(context); 
  final usuario = authProvider.usuario!;
  profileServices.nombre = authProvider.usuario!.nombre;
  profileServices.email = authProvider.usuario!.email;
  profileServices.apellido = authProvider.usuario!.apellido;
  profileServices.telefono = authProvider.usuario!.telefono;
  profileServices.profesion = authProvider.usuario!.profesion;
    return Form(
      key: profileServices.formKey,
      child: Column(
        children: [
        Text('Datos de contacto', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Cascaron(child: TextFormField(
          initialValue: usuario.nombre,
        onChanged: (value){
        profileServices.nombre = value;
        print(value); 
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Nombre', labelText: 'Nombre', prefixIcon: Icons.text_fields),
      ),),
          SizedBox(height: 20,),
        Cascaron(child: TextFormField(
          initialValue: usuario.apellido,
        onChanged: (value){
          profileServices.apellido = value;
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Apellido', labelText: 'Apellido', prefixIcon: Icons.title),
      ),),
          SizedBox(height: 20,),
        Cascaron(child: TextFormField(
          initialValue: usuario.email,
        onChanged: (value){
        profileServices.email = value; 
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Email', labelText: 'Email', prefixIcon: Icons.email),
      ),),
          SizedBox(height: 20,),
        Cascaron(child: TextFormField(
          initialValue: usuario.telefono,
        onChanged: (value){
        profileServices.telefono = value; 
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Telefono', labelText: 'Telefono', prefixIcon: Icons.call),
      ),),
          SizedBox(height: 20,),
       
        Cascaron(child: TextFormField(
          initialValue: usuario.profesion,
        onChanged: (value){
          profileServices.profesion = value;
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Profesion', labelText: 'Profesion', prefixIcon: Icons.work),
      ),),
          SizedBox(height: 40,),
        
          
         Boton(text: 'Guardar', onPressed: ()async{
           final resp = await authProvider.editUsuario(profileServices.nombre, usuario.id, profileServices.apellido, profileServices.email, profileServices.telefono, profileServices.profesion);
           if(resp){
             Navigator.pop(context);
           }else{
             print('error');
           }
         }),
         SizedBox(height: 20,)

        ],
      ),
    );
  }
}
class FormularioHabilidad extends StatelessWidget {

  const FormularioHabilidad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final ctrlHabilidad = TextEditingController();
  final authProvider = Provider.of<Auth>(context); 
    return Column(
        children: [
          Text('Habilidad', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Cascaron(
            child: TextFormField(
              decoration: InputDecorations.authInputDecoration(hintText: 'Habilidad', labelText: 'Habilidad', prefixIcon: Icons.assignment),
              controller: ctrlHabilidad,
            ),
          ),
          SizedBox(height: 20,),
              Boton(text: 'Guardar', onPressed: ()async{
                final resp = await authProvider.newHabilidad(ctrlHabilidad.text);
                if(resp){
                  Navigator.pop(context);
                }else{
                  print('error');
                }
              }),
          
        ],
      );
  }
}
class FormulariEmpleo extends StatelessWidget {
  final Empleo? empleo;
  const FormulariEmpleo({
    Key? key, this.empleo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final ctrlEmpresa = TextEditingController();
  final ctrlCargo = TextEditingController();
  final ctrlDescription = TextEditingController();
  final authProvider = Provider.of<Auth>(context); 
  if(empleo != null){
    ctrlEmpresa.text = empleo!.empresa;
    ctrlCargo.text = empleo!.cargo;
    ctrlDescription.text = empleo!.description;
  }
    return Column(
        children: [
          empleo != null ? Text('Editar empleo', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),) :
          Text('Empleo', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Cascaron(
            child: TextFormField(
              decoration: InputDecorations.authInputDecoration(hintText: 'Empresa', labelText: 'Empresa', prefixIcon: Icons.assignment),
              controller: ctrlEmpresa,
            ),
          ),
          SizedBox(height: 20,),
          Cascaron(
            child: TextFormField(
              decoration: InputDecorations.authInputDecoration(hintText: 'Cargo', labelText: 'Cargo', prefixIcon: Icons.assignment),
              controller: ctrlCargo,
            ),
          ),
          SizedBox(height: 20,),
          Cascaron(
            child: TextFormField(
              maxLines: 8,
              decoration: InputDecorations.authInputDecoration(hintText: 'Description', labelText: 'Description', prefixIcon: Icons.assignment),
              controller: ctrlDescription,
            ),
          ),
          SizedBox(height: 20,),
              Boton(text: 'Guardar', onPressed:empleo != null  ?()async{
                final resp = await authProvider.editEmpleo(ctrlEmpresa.text, ctrlCargo.text, ctrlDescription.text, empleo!.id);
                if(resp){
                  Navigator.pop(context);
                }else{
                  print('error');
                }
              } :()async{
                final resp = await authProvider.newEmpleo(ctrlEmpresa.text, ctrlCargo.text, ctrlDescription.text);
                if(resp){
                  Navigator.pop(context);
                }else{
                  print('error');
                }
              }),
          
        ],
      );
  }
}