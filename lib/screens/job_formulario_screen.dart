import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/services/edit_job_services.dart';
import 'package:master_jobz/ui/input_decoration.dart';
import 'package:master_jobz/ui/style_decoration.dart';
import 'package:master_jobz/widgets/boton.dart';
import 'package:master_jobz/widgets/cuerpo.dart';
import 'package:provider/provider.dart';
class FormularioJob extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final jobServices = Provider.of<EditJobServices>(context); 
  final jobProvider = Provider.of<JobProvider>(context); 
    return Scaffold(
      appBar: AppBar(
        title: Text('Trabajo', style: TextStyle(color: Colors.black),),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.red
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Form(
              key: jobServices.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                
                SizedBox(height: 20,),
                Pad(child: Text('Título',style: TextStyleDecoration.textStyleDecoration(), )),
                Pad(
                  title: true,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black45),
                    maxLength: 11,
                    // initialValue: usuario.nombre,
                  onChanged: (value){
                  jobServices.title = value; 
                  },
                  validator:  (value){
                  return (value != null && value.length >1 )
                  ? null
                  : 'El título debe tener mas de 1 caracter';
                },
                  decoration: InputDecorations.editJobDecoration(hint: 'Agregar título'),
                              ),
                ),
                  SizedBox(height: 20,),
               
                Pad(child: Text('Sub-título',style: TextStyleDecoration.textStyleDecoration(), )),
                Pad(
                  title: true,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black45),
                    maxLength: 18,
                    // initialValue: usuario.email,
                  onChanged: (value){
                  jobServices.subTitle = value; 
                  },
                  validator:  (value){
                  return (value != null && value.length >3 )
                  ? null
                  : 'El sub-título debe tener mas de 3 caracteres';
                },
                  decoration: InputDecorations.editJobDecoration(hint: 'Agregar sub-título'),
                              ),
                ),
               SizedBox(height: 20,),
                Pad(child: Text('Descripción',style: TextStyleDecoration.textStyleDecoration(), )),
                Pad(
                  title: true,
                  child: TextFormField(
                    minLines: 8,
                    maxLines: 8,
                    // initialValue: usuario.email,
                    style: TextStyle(color: Colors.black45),
                  onChanged: (value){
                  jobServices.description = value; 
                  },
                  validator:  (value){
                  return (value != null && value.length >8 )
                  ? null
                  : 'La descripción debe tener mas de 8 caractereres';
                },
                  decoration: InputDecorations.editJobDecoration(hint: 'Agregar descripción'),
                              ),
                ),
               SizedBox(height: 20,),
                Pad(child: Text('Total',style: TextStyleDecoration.textStyleDecoration(), )),
                Pad(
                  title: true,
                  child: TextFormField(
                   
                    style: TextStyle(color: Colors.black45),
                  onChanged: (value){
                  jobServices.totalRequerido =  int.parse(value); 
                  },
                  decoration: InputDecorations.editJobDecoration(hint: 'Agregar total'),
                              ),
                ),
                
                Pad(
                  title: true,
                  child: MaterialButton(
                    child: Text('Agregar trabajo', style: TextStyle(color: Colors.red,),),
                    onPressed: jobServices.isLoading ? null: ()async{
                    FocusScope.of(context).unfocus();
                    if(!jobServices.isValidForm()) return;
                    jobServices.isLoading = true;
                    final resp = await jobProvider.newJob(jobServices.title, jobServices.subTitle, jobServices.description, jobServices.totalRequerido);
                    jobServices.isLoading = false;
                    if(resp){
                      Navigator.pop(context);
                      // Navigator.pop(context);
                    }
                  }),
                ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}