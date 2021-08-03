import 'package:flutter/material.dart';
import 'package:master_jobz/models/usuario.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:provider/provider.dart';


class ProfilePublicoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authProvider = Provider.of<Auth>(context);
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
                  Text('Habilidades', style: TextStyle(color:Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('JS', style: TextStyle(fontSize: 20),),
                      Text('40%', style: TextStyle(fontSize: 20),),
                      
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('DART', style: TextStyle(fontSize: 20),),
                      Text('20%', style: TextStyle(fontSize: 20),),
                      
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PHP', style: TextStyle(fontSize: 20),),
                      Text('40%', style: TextStyle(fontSize: 20),),
                      
                    ],
                  ),

                  SizedBox(height: 20,),
                  Text('Repositorio', style: TextStyle(color:Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold),),
                  Container(
                    width: double.infinity,
                    height: 600,
                    
                  )
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
      backgroundColor: Color(0xff0F1225),
      expandedHeight: 230.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          '${usuario.nombre}',
          style: TextStyle(color:Colors.white, fontSize: 16.0),
          ),
          background:Column(
              children: [
                SafeArea(child: Container(height: 20,)),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xff0F1225),
                    border: Border.all(color: Color(0xff75F39F), width: 4),
                    borderRadius: BorderRadius.circular(200)
                  ),
                  child: Center(child: Text('${usuario.nombre.substring(0,2)}', style: TextStyle(fontSize: 30, color: Color(0xff75F39F), fontWeight: FontWeight.bold),),),
                ),
                SizedBox(height: 10,),
                Text('+56985252939',style: TextStyle(color:Color(0xff75F39F), fontSize: 16.0)),
                Text('${usuario.email}',style: TextStyle(color:Color(0xff75F39F), fontSize: 16.0)),
              ],
          ),
      ),
    );
  }
}

