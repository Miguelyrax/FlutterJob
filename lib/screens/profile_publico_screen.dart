import 'package:flutter/material.dart';
import 'package:master_jobz/models/empleo.dart';
import 'package:master_jobz/models/habilidad.dart';
import 'package:master_jobz/models/usuario.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/peticiones/postulantes.dart';
import 'package:master_jobz/widgets/alert.dart';
import 'package:master_jobz/widgets/formularios.dart';
import 'package:provider/provider.dart';


class ProfilePublicoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authProvider = Provider.of<Auth>(context);
    List<Habilidad> habilidades = authProvider.usuario!.habilidades;
    List<Empleo> empleos = authProvider.usuario!.empleos;
    final postulanteProvider = Provider.of<Postulantes>(context);
    final usuario = authProvider.usuario!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
          _crearAppbar(usuario),
          SliverList(delegate: SliverChildListDelegate(
            [
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Caja(
                    authProvider: authProvider,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Datos de contacto', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                          IconButton(onPressed: (){
                            editContacto(context,Formulario());
                          }, icon: Icon(Icons.edit, color: Colors.green,))
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 20,),
                      Text('Telefono', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: Colors.black45),),
                      Text('+56985252939', style: TextStyle(fontSize: 17),),
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
                  Caja(authProvider: authProvider,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Habilidades', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                          IconButton(onPressed: ()=>editContacto(context,FormularioHabilidad()), icon: Icon(Icons.add_circle, color: Colors.green,))
                        ],
                      ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_,i) => Row(
                            children: [
                              Text('${habilidades[i].habilidad}', style: TextStyle(fontSize: 17),),
                              IconButton(onPressed: ()async{
                                await authProvider.deleteHabilidad(habilidades[i].id);
                              }, icon: Icon(Icons.cancel, color: Colors.black26,))
                            ],
                          ),
                          separatorBuilder: (_,snapshot)=> SizedBox(height: 20),
                          itemCount: habilidades.length),
        
                        SizedBox(height: 20,),
                    ],
                  ),),
                  SizedBox(height: 20,),
                  Caja(authProvider: authProvider,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Experiencia laboral', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                          IconButton(onPressed: (){
                            editContacto(context, FormulariEmpleo());
                          }, icon: Icon(Icons.add_circle, color: Colors.green,))
                        ],
                      ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_,i) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${empleos[i].cargo} en ${empleos[i].empresa}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
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
                                  }, icon: Icon(Icons.delete, color: Colors.red,)),
                                  IconButton(onPressed: (){
                                    editContacto(context, FormulariEmpleo(empleo: empleos[i],),);
                                  }, icon: Icon(Icons.edit, color: Colors.green,)),
                                ],
                              )
                            ],
                          ),
                          separatorBuilder: (_,snapshot)=> Divider(height: 10,thickness: 1,color: Colors.black26,),
                          itemCount: empleos.length),
                    ],
                  ),)      ,
                  SizedBox(height: 20,),
                  Caja(authProvider: authProvider,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Educación', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_,i) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${empleos[i].cargo} en ${empleos[i].empresa}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('${empleos[i].description}', style: TextStyle(fontSize: 17),),
                              SizedBox(height: 10,),
                            ],
                          ),
                          separatorBuilder: (_,snapshot)=> Divider(height: 10,thickness: 1,color: Colors.black26,),
                          itemCount: empleos.length),
                    ],
                  ),)      ,
                        
                      
                ],
              )),
              
            ]
          ))
        ],
      )
   );
  } 

  Widget _crearAppbar(Usuario usuario ) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Color(0xffF5CB39),
      expandedHeight: 230.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          '${usuario.nombre} ${usuario.apellido}',
          style: TextStyle(color:Colors.black, fontSize: 16.0),
          ),
          background:Column(
              children: [
                SafeArea(child: Container(height: 20,)),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffF5CB39),
                    border: Border.all(color: Colors.black, width: 4),
                    borderRadius: BorderRadius.circular(200)
                  ),
                  child: Center(child: Text('${usuario.nombre.substring(0,2)}', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),),),
                ),
                SizedBox(height: 10,),
                Text('${usuario.telefono}',style: TextStyle(color:Colors.black, fontSize: 16.0)),
                Text('${usuario.email}',style: TextStyle(color:Colors.black, fontSize: 16.0)),
              ],
          ),
      ),
    );
  }
}

class Caja extends StatelessWidget {
  final Widget child;
  const Caja({
    Key? key,
    required this.authProvider,required  this.child,
  }) : super(key: key);

  final Auth authProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
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
            ),
    );
  }
}

