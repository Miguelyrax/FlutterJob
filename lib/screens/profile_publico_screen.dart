import 'package:flutter/material.dart';
import 'package:master_jobz/helpers/environment.dart';
import 'package:master_jobz/models/capacitacione.dart';
import 'package:master_jobz/models/empleo.dart';
import 'package:master_jobz/models/habilidad.dart';

import 'package:master_jobz/peticiones/auth.dart';

import 'package:master_jobz/services/educacion_services.dart';
import 'package:master_jobz/services/empleo_services.dart';
import 'package:master_jobz/services/formhabilidad_services.dart';
import 'package:master_jobz/services/profile_services.dart';

import 'package:master_jobz/widgets/alert.dart';
import 'package:master_jobz/widgets/formularios.dart';
import 'package:master_jobz/widgets/pageroute.dart';
import 'package:provider/provider.dart';


class ProfilePublicoScreen extends StatefulWidget {
  @override
  _ProfilePublicoScreenState createState() => _ProfilePublicoScreenState();
}

class _ProfilePublicoScreenState extends State<ProfilePublicoScreen> {
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<Auth>(context);
    List<Habilidad> habilidades = authProvider.usuario!.habilidades;
    List<Empleo> empleos = authProvider.usuario!.empleos;
    List<Capacitacione> capacitaciones = authProvider.usuario!.capacitaciones;

    final usuario = authProvider.usuario!;
    return Scaffold(
            extendBody: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20,),
              
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Caja( child: 
                  Column(
              children: [
               
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Environment.rojo,
                    border: Border.all(color: Colors.black, width: 4),
                    borderRadius: BorderRadius.circular(200)
                  ),
                  child: Center(child: Text('${usuario.nombre.substring(0,2)}', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),),
                ),
                SizedBox(height: 10,),
                Text('${usuario.telefono}',style: TextStyle(color:Colors.black, fontSize: 16.0)),
                Text('${usuario.email}',style: TextStyle(color:Colors.black, fontSize: 16.0)),
                SizedBox(height: 10,),
                Text('${usuario.nombre} ${usuario.apellido}',style: TextStyle(color:Colors.black, fontSize: 20.0)),
                  ],
              ),
                  ),
                  SizedBox(height: 20,),
                  Caja(
                    
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Datos de contacto', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                          IconButton(onPressed: (){
                            Navigator.push(context, ruta( ChangeNotifierProvider(create: ( _ ) => ProfileProvider(),child: Formulario()), Offset(2,0), false));
                          }, icon: Icon(Icons.edit, color: Colors.black,))
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 20,),
                      Text('Telefono', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: Colors.black45),),
                      Text('${authProvider.usuario!.telefono}', style: TextStyle(fontSize: 17),),
                      SizedBox(height: 20,),
                      Text('Correo', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: Colors.black45),),
                      Text('${authProvider.usuario!.email}', style: TextStyle(fontSize: 17),),
                      SizedBox(height: 20,),
                      Text('Profesión', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: Colors.black45),),
                      Text('${authProvider.usuario!.profesion}', style: TextStyle(fontSize: 17),),
                      
                      SizedBox(height: 20,),
                          ],
              ),
                    ),
                  SizedBox(height: 20,),
                  Caja(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Habilidades', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                          IconButton(onPressed: ()=>Navigator.push(context, ruta(ChangeNotifierProvider(create: ( _ ) => FormHabilidadProvider(),child: FormularioHabilidad()), Offset(2,0),true)), icon: Icon(Icons.add_circle, color: Colors.black,))
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 20,),
                     
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_,i) => Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text('${habilidades[i].habilidad}', style: TextStyle(fontSize: 17),),
                              IconButton(onPressed: ()async{
                                await authProvider.deleteHabilidad(habilidades[i].id);
                              }, icon: Icon(Icons.cancel, color: Colors.black26,))
                            ],
                          ),

                          itemCount: habilidades.length,
                          padding: EdgeInsets.only(bottom: 0),
                           gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2,
                            
                            
                          ),),
                    ],
                  ),),
                  SizedBox(height: 20,),
                  Caja(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Experiencia laboral', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                          IconButton(onPressed: (){
                            Navigator.push(context, ruta(ChangeNotifierProvider(create: ( _ ) => EmpleoProvider(),child: FormulariEmpleo()),Offset(2,0),true));
                          }, icon: Icon(Icons.add_circle, color: Colors.black,))
                        ],
                      ),
                    
                      SizedBox(height: 20,),
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_,i) => Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            
                            children: [
                               Divider(),
                              Container(width: double.infinity,child: Text('${empleos[i].cargo} en ${empleos[i].empresa}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)),
                              SizedBox(height: 10,),
                              Text('${empleos[i].description}', style: TextStyle(fontSize: 17),),
                              SizedBox(height: 10,),
                              Row(
                                
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){
                                    alertEliminar(context,()async{
                                      await authProvider.deleteEmpleo(empleos[i].id);
                                      Navigator.pop(context);
                                    });
                                  }, icon: Icon(Icons.delete, color: Environment.rojo,)),
                                  IconButton(onPressed: (){
                                    Navigator.push(context, ruta(ChangeNotifierProvider(create: ( _ ) => EmpleoProvider(),child:FormulariEmpleo(empleo: empleos[i])), Offset(2,0), true));
                                  }, icon: Icon(Icons.edit, color: Colors.black,)),
                                ],
                              )
                            ],
                          ),
                           itemCount: empleos.length,
                          padding: EdgeInsets.only(bottom: 0),
                           gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 2,
                            
                            
                          ),),
                    
                    
                    ],
                  ),)      ,
                  SizedBox(height: 20,),
                  Caja(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Educación', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                          IconButton(onPressed: (){
                            Navigator.push(context, ruta(ChangeNotifierProvider(create: ( _ ) => EducacionProvider(),child: FormulariEducacion()),Offset(2,0),true));
                          }, icon: Icon(Icons.add_circle, color: Colors.black,))
                        ],
                      ),
                     
                      SizedBox(height: 20,),
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_,i) => Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                               Divider(),
                              SizedBox(height: 10,),
                              Container(width: double.infinity,child: Text('${capacitaciones[i].tema}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)),
                              SizedBox(height: 20,),
                              Text('${capacitaciones[i].establecimiento}', style: TextStyle(fontSize: 17),),
                              
                     
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){
                                    alertEliminar(context,()async{
                                      await authProvider.deleteEducacion(capacitaciones[i].id);
                                      Navigator.pop(context);
                                    });
                                  }, icon: Icon(Icons.delete, color: Environment.rojo,)),
                                  IconButton(onPressed: (){
                                    Navigator.push(context, ruta(ChangeNotifierProvider(create: ( _ ) => EducacionProvider(),child: FormulariEducacion(capacitacion: capacitaciones[i])), Offset(2,0), true));
                                  }, icon: Icon(Icons.edit, color: Colors.black,)),
                                ],
                              ),
                              
                            ],
                          ),
                          padding: EdgeInsets.only(bottom: 0),
                           gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 2,
                            
                            
                          ),
                          itemCount: capacitaciones.length),
                    ],
                  ),)      ,
                  SizedBox(height: 140,),
                        
                      
                ],
              )),
            ],
          ),
        ),
        
      )
   );
  } 
}

class Caja extends StatelessWidget {
  final Widget child;
  const Caja({
    Key? key,
    required  this.child,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 2,
            spreadRadius: 0.2,
            offset: Offset(0,2)
          )]
        ),
        child: this.child
          
    );
  }
}

