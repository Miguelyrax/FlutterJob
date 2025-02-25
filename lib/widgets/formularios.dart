import 'package:flutter/material.dart';
import 'package:master_jobz/helpers/environment.dart';
import 'package:master_jobz/models/capacitacione.dart';
import 'package:master_jobz/models/empleo.dart';
import 'package:master_jobz/models/requerimiento.dart';
import 'package:master_jobz/models/requisito.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/services/educacion_services.dart';
import 'package:master_jobz/services/empleo_services.dart';
import 'package:master_jobz/services/formhabilidad_services.dart';
import 'package:master_jobz/services/habilidad_services.dart';

import 'package:master_jobz/services/profile_services.dart';
import 'package:master_jobz/services/requisitos_services.dart';
import 'package:master_jobz/ui/input_decoration.dart';
import 'package:master_jobz/ui/style_decoration.dart';
import 'package:master_jobz/widgets/boton.dart';
import 'package:master_jobz/widgets/boton_date.dart';

import 'package:master_jobz/widgets/cuerpo.dart';
import 'package:provider/provider.dart';

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
    return WillPopScope(
      onWillPop:profileServices.isLoading ? ()async{return false;}: ()async{
          FocusScope.of(context).unfocus();
          if(!profileServices.isValidForm()) return false;
          profileServices.isLoading = true;
          await authProvider.editUsuario(profileServices.nombre, usuario.id, profileServices.apellido, profileServices.email, profileServices.telefono, profileServices.profesion);
          profileServices.isLoading = false;
          Navigator.pop(context);
          return true;
      },
      child: Scaffold(
        
        appBar:  AppBar(
          title: Text('Trabajo', style: TextStyle(color: Colors.black),),
          centerTitle: false,
          leading:IconButton(icon:profileServices.isLoading ? Loading(): Icon(Icons.arrow_back, size: 24,),onPressed:profileServices.isLoading?  null: ()async{
          FocusScope.of(context).unfocus();
          if(!profileServices.isValidForm()) return;
          profileServices.isLoading = true;
          await authProvider.editUsuario(profileServices.nombre, usuario.id, profileServices.apellido, profileServices.email, profileServices.telefono, profileServices.profesion);   
          Navigator.pop(context);
          profileServices.isLoading = false;
          
          },),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Environment.rojo
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: profileServices.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
              // Text('Datos de contacto', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Pad(child: Text('Nombre',style: TextStyleDecoration.textStyleDecoration(), )),
              Pad(
                title: true,
                child: TextFormField(
                  style: TextStyle(color: Colors.black45),
                  initialValue: usuario.nombre,
                onChanged: (value){
                profileServices.nombre = value;
                },
                validator:  (value){
                return (value != null && value.length >2 )
                ? null
                : 'El nombre debe tener mas de 2 caracteres';
                },
                decoration: InputDecorations.editJobDecoration(),
                      ),
              ),
                SizedBox(height: 20,),
              Pad(child: Text('Apellido',style: TextStyleDecoration.textStyleDecoration(), )),
              Pad(
                title: true,
                child: TextFormField(
                  style: TextStyle(color: Colors.black45),
                  initialValue: usuario.apellido,
                onChanged: (value){
                  profileServices.apellido = value;
                },
                validator:  (value){
                return (value != null && value.length >2 )
                ? null
                : 'El apellido debe tener mas de 2 caracteres';
                },
                decoration: InputDecorations.editJobDecoration(hint: 'Agregar apellido'),
                      ),
              ),
                SizedBox(height: 20,),
                Pad(child: Text('Email',style: TextStyleDecoration.textStyleDecoration(), )),
              Pad(
                title: true,
                child: TextFormField(
                  style: TextStyle(color: Colors.black45),
                  initialValue: usuario.email,
                onChanged: (value){
                profileServices.email = value; 
                },
                validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                ? null
                : 'El correo no es válido' ;
              },
                decoration: InputDecorations.editJobDecoration(),
                      ),
              ),
                SizedBox(height: 20,),
                Pad(child: Text('Telefono',style: TextStyleDecoration.textStyleDecoration(), )),
              Pad(
                title: true,
                child: TextFormField(
                  style: TextStyle(color: Colors.black45),
                  initialValue: usuario.telefono,
                onChanged: (value){
                profileServices.telefono = value; 
                },
                decoration: InputDecorations.editJobDecoration(hint: 'Agregar telefono'),
                      ),
              ),
                SizedBox(height: 20,),
                Pad(child: Text('Profesión',style: TextStyleDecoration.textStyleDecoration(), )),
             
              Pad(
                title: true,
                child: TextFormField(
                  style: TextStyle(color: Colors.black45),
                  initialValue: usuario.profesion,
                onChanged: (value){
                  profileServices.profesion = value;
                },
                decoration: InputDecorations.editJobDecoration(hint: 'Agregar profesión'),
                        ),
              ),
                SizedBox(height: 40,),
              
                
 
            
              ],
            ),
          ),
        ),
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

  final authProvider = Provider.of<Auth>(context); 
  final formHabilidadProvider = Provider.of<FormHabilidadProvider>(context); 
    return 
      Scaffold(
 
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Habilidad', style: TextStyle(color: Colors.black),),
          centerTitle: false,
          leading: IconButton(icon:formHabilidadProvider.isLoading ? Loading(): Icon(Icons.arrow_back, size: 24,),onPressed:()=>Navigator.pop(context)),
          iconTheme: IconThemeData(
            color: Environment.rojo
          ),
        ),
        body: Form(
          key: formHabilidadProvider.formKey,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: TextFormField(
                  decoration: InputDecorations.edicionesDecoration(),
                  initialValue: formHabilidadProvider.habilidad,
                  onChanged: (value){
                    formHabilidadProvider.habilidad = value;
                  },
                  validator:  (value){
                  return (value != null && value.length >1 )
                  ? null
                  : 'La habilidad debe tener mas de 1 caracter';
                  },
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(onPressed:formHabilidadProvider.isLoading ? null :  ()async{
                FocusScope.of(context).unfocus();
                    if(!formHabilidadProvider.isValidForm()) return;
                    formHabilidadProvider.isLoading = true;
                    await authProvider.newHabilidad(formHabilidadProvider.habilidad);
                    formHabilidadProvider.isLoading = false;
                    Navigator.pop(context);              
                  },child: Text('Agregar habilidad', style: TextStyle(color: Environment.rojo,),))
            ],
          ),
        ),
      );
  }
}
class FormulariEmpleo extends StatefulWidget {
  final Empleo? empleo;
  const FormulariEmpleo({
    Key? key, this.empleo,
  }) : super(key: key);

  @override
  _FormulariEmpleoState createState() => _FormulariEmpleoState();
}

class _FormulariEmpleoState extends State<FormulariEmpleo> {
  @override
  void initState() { 
    final empleoProvider = Provider.of<EmpleoProvider>(context,listen: false); 
    if(widget.empleo != null){
    empleoProvider.empresa = widget.empleo!.empresa;
    empleoProvider.cargo = widget.empleo!.cargo;
    empleoProvider.descripcion = widget.empleo!.description;
    empleoProvider.inicio = widget.empleo!.inicio;
    empleoProvider.termino = widget.empleo!.termino;
  }
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
  final authProvider = Provider.of<Auth>(context); 
  final empleoProvider = Provider.of<EmpleoProvider>(context); 
    return WillPopScope(
      onWillPop:empleoProvider.isLoading ? ()async{return false;} : widget.empleo != null ?()async{
                    FocusScope.of(context).unfocus();
                    if(!empleoProvider.isValidForm()) return false;
                    empleoProvider.isLoading = true;
                    await authProvider.editEmpleo(empleoProvider.empresa, empleoProvider.cargo, empleoProvider.descripcion,empleoProvider.inicio,empleoProvider.termino, widget.empleo!.id);
                    empleoProvider.isLoading = false;
                    
                    return true;
                  }:null,
      child: Scaffold(

        appBar: AppBar(
          title: widget.empleo != null ? Text('Editar empleo', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),) :
                Text('Empleo', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
          centerTitle: false,
          leading:IconButton(icon:empleoProvider.isLoading ? Loading(): Icon(Icons.arrow_back, size: 24,),onPressed:empleoProvider.isLoading ? null : widget.empleo != null ?()async{
          FocusScope.of(context).unfocus();
          if(!empleoProvider.isValidForm()) return;
          empleoProvider.isLoading = true;
          await authProvider.editEmpleo(empleoProvider.empresa, empleoProvider.cargo, empleoProvider.descripcion,empleoProvider.inicio,empleoProvider.termino, widget.empleo!.id);    
          Navigator.pop(context);
          empleoProvider.isLoading = false;
          
          }:()=>Navigator.pop(context)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Environment.rojo
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: empleoProvider.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
                children: [
                  
                  SizedBox(height: 20,),
                  Pad(child: Text('Empresa',style: TextStyleDecoration.textStyleDecoration(), )),
                  Pad(
                    title: true,
                    child: TextFormField(
                      decoration: InputDecorations.editJobDecoration(hint: 'Agregar empresa'),
                      initialValue: empleoProvider.empresa,
                      onChanged: (value){
                        empleoProvider.empresa = value;
                      },
                      validator:  (value){
                      return (value != null && value.length >2 )
                      ? null
                      : 'La empresa debe tener mas de 2 caracteres';
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Pad(child: Text('Cargo',style: TextStyleDecoration.textStyleDecoration(), )),
                  Pad(
                    title: true,
                    child: TextFormField(
                      decoration: InputDecorations.editJobDecoration(hint: 'Agregar cargo'),
                      initialValue: empleoProvider.cargo,
                      onChanged: (value){
                        empleoProvider.cargo = value;
                      },
                      validator:  (value){
                      return (value != null && value.length >5 )
                      ? null
                      : 'El cacrgo debe tener mas de 5 caracteres';
                      },
                    ),
                  ),
                  Pad(child: Text('Inicio',style: TextStyleDecoration.textStyleDecoration(), )),
                   Pad(
                     title: true,
                     child: BotonDate(funcion: (result)=>empleoProvider.setInicio = result, value: empleoProvider.inicio,),
                   ),
                  Pad(child: Text('Final',style: TextStyleDecoration.textStyleDecoration(), )),
                   Pad(
                     title: true,
                     child: BotonDate(funcion: (result)=>empleoProvider.setFinal = result, value: empleoProvider.termino,),
                   ),
                   Pad(child: Text(empleoProvider.msg,style: TextStyleDecoration.textStyleDecorationRojo(), )),
                   
                 
                  SizedBox(height: 20,),
                  Pad(child: Text('Descripción',style: TextStyleDecoration.textStyleDecoration(), )),
                  Pad(
                    title: true,
                    child: TextFormField(
                      maxLines: null,
                      decoration: InputDecorations.editJobDecoration(hint: 'Agregar descripción'),
                      initialValue: empleoProvider.descripcion,
                      onChanged: (value){
                        empleoProvider.descripcion = value;
                      },
                      validator:  (value){
                      return (value != null && value.length >10 )
                      ? null
                      : 'La descripción debe tener mas de 10 caracteres';
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  widget.empleo != null ?
                      Container():MaterialButton(onPressed: empleoProvider.isLoading ? null : ()async{
                        FocusScope.of(context).unfocus();
                        if(!empleoProvider.isValidForm()) return;
                        empleoProvider.isLoading = true;
                        await authProvider.newEmpleo(empleoProvider.empresa, empleoProvider.cargo, empleoProvider.descripcion,empleoProvider.inicio, empleoProvider.termino);
                        empleoProvider.isLoading = false;
                        Navigator.pop(context);
                       
                        
                      },child: Text('Agregar empleo', style: TextStyle(color: Environment.rojo,),))
                  
                ],
              ),
          ),
        ),
      ),
    );
  }
}


class FormulariEducacion extends StatefulWidget {
  final Capacitacione? capacitacion;
  const FormulariEducacion({
    Key? key, this.capacitacion,
  }) : super(key: key);

  @override
  _FormulariEducacionState createState() => _FormulariEducacionState();
}

class _FormulariEducacionState extends State<FormulariEducacion> {
  @override
  void initState() { 
    final cvProvider = Provider.of<EducacionProvider>(context, listen: false); 
    if(widget.capacitacion != null){
    cvProvider.establecimiento = widget.capacitacion!.establecimiento;
    cvProvider.tema = widget.capacitacion!.tema;
    cvProvider.inicio = widget.capacitacion!.inicio;
    cvProvider.termino = widget.capacitacion!.termino;
  }
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {


  final authProvider = Provider.of<Auth>(context); 
  final cvProvider = Provider.of<EducacionProvider>(context); 

    return WillPopScope(
      onWillPop:cvProvider.isLoading ? ()async{return false;}: widget.capacitacion != null ?()async{
                      FocusScope.of(context).unfocus();
                      if(!cvProvider.isValidForm()) {

                        return false;
                      }
                      cvProvider.isLoading = true;
                     await authProvider.editEducacion(cvProvider.establecimiento, cvProvider.tema,cvProvider.inicio,cvProvider.termino, widget.capacitacion!.id);
                    cvProvider.isLoading = false;
                    return true;
                  }:null,
      child: Scaffold(
        appBar: AppBar(
          title: widget.capacitacion != null ? Text('Editar capacitación', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),) :
          Text('Capacitación', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
          leading:IconButton(icon:cvProvider.isLoading ? Loading(): Icon(Icons.arrow_back, size: 24,),onPressed:cvProvider.isLoading ? null: widget.capacitacion != null ? ()async{
          FocusScope.of(context).unfocus();
          if(!cvProvider.isValidForm()) return;
          cvProvider.isLoading = true;
          await await authProvider.editEducacion(cvProvider.establecimiento, cvProvider.tema,cvProvider.inicio,cvProvider.termino, widget.capacitacion!.id);     
          Navigator.pop(context);
          cvProvider.isLoading = false;
          
          }:()=>Navigator.pop(context)),  
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Environment.rojo
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: cvProvider.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
                children: [
                  
                  SizedBox(height: 20,),
                  Pad(child: Text('Establecimiento',style: TextStyleDecoration.textStyleDecoration(), )),
                  Pad(
                    title: true,
                    child: TextFormField(
                      decoration: InputDecorations.editJobDecoration(hint: 'Agregar establecimiento'),
                      initialValue: cvProvider.establecimiento,
                      onChanged: (value){
                        cvProvider.establecimiento = value;
                      },
                      validator:  (value){
                      return (value != null && value.length >1 )
                      ? null
                      : 'El establecimiento debe tener mas de 5 caracteres';
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Pad(child: Text('Materia',style: TextStyleDecoration.textStyleDecoration(), )),
                  Pad(
                    title: true,
                    child: TextFormField(
                      decoration: InputDecorations.editJobDecoration(hint: 'Agregar materia'),
                      initialValue: cvProvider.tema,
                      onChanged: (value){
                        cvProvider.tema = value;
                      },
                      validator:  (value){
                      return (value != null && value.length >1 )
                      ? null
                      : 'La meteria debe tener mas de 1 caracter';
                      },
                    ),
                  ),
                  Pad(child: Text('Inicio',style: TextStyleDecoration.textStyleDecoration(), )),
                   Pad(
                     title: true,
                     child: BotonDate(funcion: (result)=>cvProvider.setInicio = result, value: cvProvider.inicio,),
                   ),
                  Pad(child: Text('Término',style: TextStyleDecoration.textStyleDecoration(), )),
                   Pad(
                     title: true,
                     child: BotonDate(funcion: (result)=>cvProvider.setFinal = result, value: cvProvider.termino,),
                   ),
                  Pad(child: Text(cvProvider.msg,style: TextStyleDecoration.textStyleDecorationRojo(), )),
                  SizedBox(height: 20,),
                  widget.capacitacion != null ?
                      Container():MaterialButton(onPressed:cvProvider.isLoading ? null : ()async{
                        FocusScope.of(context).unfocus();
                        if(!cvProvider.isValidForm()) return;
                        cvProvider.isLoading = true;
                        await authProvider.newEducacion(cvProvider.establecimiento, cvProvider.tema, cvProvider.inicio, cvProvider.termino);
                        Navigator.pop(context);
                        cvProvider.isLoading = false;
                       
                      },child: Text('Agregar capacitación', style: TextStyle(color: Environment.rojo,),))
                  
                ],
              ),
          ),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: CircularProgressIndicator(
        color: Environment.rojo,
        strokeWidth: 5,
      ),
    );
  }
}

class FormularioRequerimiento extends StatelessWidget {
  final Requerimiento? requerimiento;
  FormularioRequerimiento({Key? key, this.requerimiento}) : super(key: key);
  @override

  Widget build(BuildContext context) {
   
    final jobProvider = Provider.of<JobProvider>(context, listen: false);
    final habilidadServices = Provider.of<HabilidadServices>(context, listen: false);
    if(requerimiento != null){
    habilidadServices.requerimiento = requerimiento!.title;
  }
    return WillPopScope(
      onWillPop: habilidadServices.isLoading ? ()async{return false;}: requerimiento != null ?()async{
                      FocusScope.of(context).unfocus();
                      if(!habilidadServices.isValidForm()) {
                        return false;
                      }
                      habilidadServices.isLoading = true;
                     await jobProvider.editRequerimiento(requerimiento!.id, habilidadServices.requerimiento);
                    habilidadServices.isLoading = false;
                    return true;
                  }:null,
      child: Scaffold(
        backgroundColor: Color(0xffF5F7FA),
        appBar: AppBar(
          title:requerimiento != null ?Text('Editar habilidad',style: TextStyle(color: Colors.black),) :Text('Agregar habilidad',style: TextStyle(color: Colors.black),),
          leading: IconButton(icon:habilidadServices.isLoading ? Loading(): Icon(Icons.arrow_back, size: 24,),onPressed:habilidadServices.isLoading ? null: requerimiento != null ? ()async{
            FocusScope.of(context).unfocus();
            if(!habilidadServices.isValidForm()) return;
            habilidadServices.isLoading = true;
            await jobProvider.editRequerimiento(requerimiento!.id, habilidadServices.requerimiento);     
            Navigator.pop(context);
            habilidadServices.isLoading = false;
            
            }:()=>Navigator.pop(context)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Environment.rojo
          ),
          
        ),
        body: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Form(
                key: habilidadServices.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  style: TextStyle(color: Colors.black45),
                  initialValue: habilidadServices.requerimiento,
                  onChanged: (value){
                    habilidadServices.requerimiento = value;
                  },
                  decoration: InputDecorations.edicionesDecoration(),
                  validator:  (value){
                    return (value != null && value.length >1 )
                    ? null
                    : 'La habilidad debe tener mas de 1 caracter';
                  },
                ),
              ),
            ),
            SizedBox(height: 30,),
            requerimiento != null ? Container() :
            MaterialButton(onPressed:habilidadServices.isLoading ? null : ()async{
                  FocusScope.of(context).unfocus();
                  if(!habilidadServices.isValidForm()) return;
                  habilidadServices.isLoading = true;
                  await jobProvider.newRequerimiento(jobProvider.job!.id, habilidadServices.requerimiento);
                  habilidadServices.isLoading = false;
                  Navigator.pop(context);
                  
                  habilidadServices.isLoading = false;
                },child: Text('Agregar habilidad', style: TextStyle(color: Environment.rojo,),))
          ],
        ),
       ),
    );
  }
}
class FormularioRequisito extends StatelessWidget {
  final Requisito? requisito;
  FormularioRequisito({Key? key, this.requisito}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
    final jobProvider = Provider.of<JobProvider>(context, listen: false);
    final habilidadServices = Provider.of<RequisitosServices>(context, listen: false);
    if(requisito != null){
    habilidadServices.requisito = requisito!.requisito;
  }
    return WillPopScope(
      onWillPop: habilidadServices.isLoading ? ()async{return false;}: requisito != null ?()async{
                      FocusScope.of(context).unfocus();
                      if(!habilidadServices.isValidForm()) {
                        return false;
                      }
                      habilidadServices.isLoading = true;
                     await jobProvider.editRequisito(requisito!.id, habilidadServices.requisito);
                    habilidadServices.isLoading = false;
                    return true;
                  }:null,
      child: Scaffold(
        backgroundColor: Color(0xffF5F7FA),
        appBar: AppBar(
          title:requisito != null ?Text('Editar habilidad',style: TextStyle(color: Colors.black),) :Text('Agregar habilidad',style: TextStyle(color: Colors.black),),
          leading: IconButton(icon:habilidadServices.isLoading ? Loading(): Icon(Icons.arrow_back, size: 24,),onPressed:habilidadServices.isLoading ? null: requisito != null ? ()async{
            FocusScope.of(context).unfocus();
            if(!habilidadServices.isValidForm()) return;
            habilidadServices.isLoading = true;
            await jobProvider.editRequisito(requisito!.id, habilidadServices.requisito);     
            Navigator.pop(context);
            habilidadServices.isLoading = false;
            
            }:()=>Navigator.pop(context)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Environment.rojo
          ),
          
        ),
        body: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Form(
                key: habilidadServices.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  style: TextStyle(color: Colors.black45),
                  initialValue: habilidadServices.requisito,
                  onChanged: (value){
                    habilidadServices.requisito = value;
                  },
                  decoration: InputDecorations.edicionesDecoration(),
                  validator:  (value){
                    return (value != null && value.length >1 )
                    ? null
                    : 'El requisito debe tener mas de 1 caracter';
                  },
                ),
              ),
            ),
            SizedBox(height: 30,),
            requisito != null ? Container() :
            MaterialButton(onPressed:habilidadServices.isLoading ? null : ()async{
                  FocusScope.of(context).unfocus();
                  if(!habilidadServices.isValidForm()) return;
                  habilidadServices.isLoading = true;
                  await jobProvider.newRequisito(jobProvider.requerimiento!.id, habilidadServices.requisito);
                  habilidadServices.isLoading = false;
                  Navigator.pop(context);
                  
                  habilidadServices.isLoading = false;
                },child: Text('Agregar habilidad', style: TextStyle(color: Environment.rojo,),))
          ],
        ),
       ),
    );
  }
}
