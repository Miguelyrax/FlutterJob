import 'package:flutter/material.dart';
import 'package:master_jobz/helpers/environment.dart';
import 'package:master_jobz/models/capacitacione.dart';
import 'package:master_jobz/models/empleo.dart';
import 'package:master_jobz/models/habilidad.dart';
import 'package:master_jobz/models/requisito.dart';

import 'package:master_jobz/peticiones/postulantes.dart';

import 'package:provider/provider.dart';


class ProfileScreen extends StatefulWidget {


  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController ; 
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
    @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final postulanteProvider = Provider.of<Postulantes>(context);
    final usuario = postulanteProvider.postulante!.usuario;
    List<Habilidad> habilidades = usuario.habilidades;
    List<Requisito> requisitos = postulanteProvider.postulante!.requisitos;
    List<Empleo> empleos = usuario.empleos;
    List<Capacitacione> capacitaciones = usuario.capacitaciones;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Environment.rojo,
        title: Text('Usuario'),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.black,
          controller: _tabController,
        tabs: [
          Tab(icon: Icon(Icons.person,), text: 'Perfil',),
          Tab(icon: Icon(Icons.work,), text: 'Experiencia',),
          Tab(icon: Icon(Icons.book_rounded,), text: 'Educación',),

        ],
        ),
        
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child:  TabBarView(
          physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Caja(child: 
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
                            
                          Text('Datos de contacto', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                                
                         
                            Divider(),
                            SizedBox(height: 20,),
                            Text('Telefono', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: Colors.black45),),
                            Text('+56985252939', style: TextStyle(fontSize: 17),),
                            SizedBox(height: 20,),
                            Text('Correo', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: Colors.black45),),
                            Text('${usuario.email}', style: TextStyle(fontSize: 17),),
                            SizedBox(height: 20,),
                            Text('Profesión', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: Colors.black45),),
                            Text('${usuario.profesion}', style: TextStyle(fontSize: 17),),
                            
                            SizedBox(height: 20,),
                                ],
                    ),
                          ),
                        SizedBox(height: 20,),
                        Caja(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                Text('Habilidades', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                              GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (_,i) => Wrap(
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey,
                                      ),
                                      child: Text('${habilidades[i].habilidad}', style: TextStyle(fontSize: 17, color: Colors.white),)),
                                  ],
                                ),
                  
                                itemCount: habilidades.length,
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
                                Text('Capacitaciones necesarias', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                              GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (_,i) => Wrap(
                                  alignment: WrapAlignment.start,
                                  
                                  children: [
                                    ListTile(
                                      title: Text('${requisitos[i].requisito}', style: TextStyle(fontSize: 17, color: Colors.black),),
                                      leading: Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                          activeColor: Colors.grey,
                                          onChanged: (value){}, value: true, ),
                                      ),
                                    )
                                  ],
                                ),
                  
                                itemCount: requisitos.length,
                                 gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 4,
                                ),),
                          ],
                        ),),
                        
                        SizedBox(height: 100,),
                              
                            
                      ],
                    )),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(height: 20,),
                        Caja(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                Text('Experiencia laboral', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                               Divider(),
                               SizedBox(height: 20,),
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
                                separatorBuilder: (_,snapshot)=> Divider(height: 10,thickness: 1,color: Colors.black12,),
                                itemCount: empleos.length),
                          ],
                        ),) ,
                        SizedBox(height: 100,), 
                    
                  ],
                ),)
              ),
              SingleChildScrollView(
                child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                  SizedBox(height: 20,),
                         Caja(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Educación', style: TextStyle(color:Colors.black45, fontSize: 20.0, fontWeight: FontWeight.bold),),
                      Divider(),
                      SizedBox(height: 20,),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_,i) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${capacitaciones[i].tema}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                              SizedBox(height: 20,),
                              Text('${capacitaciones[i].establecimiento}', style: TextStyle(fontSize: 17),),
                            ],
                          ),
                          separatorBuilder: (_,snapshot)=> Divider(height: 10,thickness: 1,color: Colors.black12,),
                          itemCount: capacitaciones.length),
                    ],
                  ),)        ,
                        SizedBox(height: 100,),
                ],),
              ))
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
   required  this.child,
  }) : super(key: key);


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

