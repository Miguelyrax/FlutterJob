import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/widgets/background.dart';
import 'package:provider/provider.dart';


class MenuScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            // await auth.logout();
            Navigator.pushNamed(context, 'profile');
          }, icon: CircleAvatar(child: Text('${auth.usuario!.nombre.substring(0,2)}',),  ),),
          IconButton(onPressed: ()async{
             await auth.logout();
             Navigator.pushNamed(context, 'login');
          }, icon: CircleAvatar(child: Icon(Icons.logout, color: Colors.white,),),  ),
          SizedBox(width: 20,)
        ],
      ),
      body: Background2(auth: auth,
               child:SingleChildScrollView(
                  child: Container(
                  margin: EdgeInsets.only(top: 250),
                  width: double.infinity,
                  
                  decoration: BoxDecoration(
                  color: Color(0xffF5CB39),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 7,
                    offset: Offset(0,-2),
                    spreadRadius: 1
                  )]
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: Column(
                            children: [
                              Text('756', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                              Text('Nuevos empleos', style: TextStyle( fontWeight: FontWeight.bold),),
                            ],
                          ),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _Elemento(icon: Icons.send, text: 'Buscar', onPressed: ()=>Navigator.pushNamed(context, 'jobs'),),
                          _Elemento(icon: Icons.verified_user, text: 'Mi CV', onPressed: ()=>Navigator.pushNamed(context, 'profilePublico') ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _Elemento(icon: Icons.folder, text: 'Agregar enpleo', onPressed: ()=>Navigator.pushNamed(context, 'empleos'),),
                          _Elemento(icon: Icons.assignment, text: 'Mis postulaciones', onPressed: ()=>Navigator.pushNamed(context, 'perfilPublico') ),
                        ],
                      ),
                           
                          
                      ],
                    ),
                  ),
                ),
              ),
          ),
   );
  }
}

class _Elemento extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;
  const _Elemento({
    Key? key, required this.icon,required  this.text,required  this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ()=>onPressed(),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black26),
            borderRadius: BorderRadius.circular(5)
          ),
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(this.icon, size: 40,),
            Text(this.text, style: TextStyle( fontWeight: FontWeight.bold),),
          ],
        ),
                            ),
      ),
    );
  }
}