import 'package:flutter/material.dart';
import 'package:master_jobz/models/job.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/services/job_services.dart';
import 'package:master_jobz/ui/input_decoration.dart';
import 'package:master_jobz/widgets/boton.dart';
import 'package:master_jobz/widgets/cabezera.dart';
import 'package:master_jobz/widgets/cascaron.dart';
import 'package:provider/provider.dart';


class OfertaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 180,),
                  Text('Agregar\n\n oferta de trabajo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ChangeNotifierProvider(create: ( _ ) => JobServices() ,child: _Formulario()),
                ],
              ),
            )
          ),
          Cabezera(user: authProvider.usuario!.nombre),

        ],
      ),
   );
  }
}

class _Formulario extends StatelessWidget {
  final Job? job;

  const _Formulario({Key? key, this.job}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final jobServices = Provider.of<JobServices>(context); 
  final jobProvider = Provider.of<JobProvider>(context); 
    return Form(
      key: jobServices.key,
      child: Column(
        children: [
          SizedBox(height: 20,),
        Cascaron(child: TextFormField(
          // initialValue: usuario.nombre,
        onChanged: (value){
        jobServices.title = value; 
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Título', labelText: 'Título', prefixIcon: Icons.title),
      ),),
          SizedBox(height: 20,),
       
        Cascaron(child: TextFormField(
          // initialValue: usuario.email,
        onChanged: (value){
        jobServices.subTitle = value; 
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Sub-título', labelText: 'Sub-título', prefixIcon: Icons.email),
      ),),
       SizedBox(height: 20,),
        Cascaron(child: TextFormField(
          // initialValue: usuario.email,
        onChanged: (value){
        jobServices.description = value; 
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Descripción', labelText: 'Descripción', prefixIcon: Icons.email),
      ),),
       SizedBox(height: 20,),
        Cascaron(child: TextFormField(
          // initialValue: usuario.email,
        onChanged: (value){
        jobServices.totalRequerido =  int.parse(value); 
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Total', labelText: 'Total', prefixIcon: Icons.email),
      ),),
          SizedBox(height: 20,),
        
          SizedBox(height: 20,),
        Boton(text: 'Guardar', onPressed: jobServices.isLoading ? null: ()async{
          jobServices.isLoading = true;
          final resp = await jobProvider.newJob(jobServices.title, jobServices.subTitle, jobServices.description, jobServices.totalRequerido);
          jobServices.isLoading = false;
          if(resp){
            Navigator.pushReplacementNamed(context, 'empleos');
          }
        })
        ],
      ),
    );
  }
}

