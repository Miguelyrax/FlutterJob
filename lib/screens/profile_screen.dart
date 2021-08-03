import 'package:flutter/material.dart';
import 'package:master_jobz/models/usuario.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/services/profile_services.dart';
import 'package:master_jobz/ui/input_decoration.dart';
import 'package:master_jobz/widgets/boton.dart';
import 'package:master_jobz/widgets/cabezera.dart';
import 'package:master_jobz/widgets/cascaron.dart';
import 'package:master_jobz/widgets/circulo.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 180,),
                  ChangeNotifierProvider(create: ( _ ) => ProfileProvider() ,child: _Formulario( user: authProvider.usuario,)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Agregar repositorio', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Circulo(onPressed: (){},)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Agregar oferta', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Circulo(onPressed:()=>Navigator.pushNamed(context, 'oferta'))
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Boton(text: 'Perfil público', onPressed: ()=>Navigator.pushNamed(context, 'profilePublico'),),
                        SizedBox(height: 20,),
                        Boton(text: 'Postulaciones', onPressed: (){},),
                        SizedBox(height: 20,),
                        Boton(text: 'Contactos', onPressed: (){},),
                        SizedBox(height: 20,),
                        Boton(text: 'Empleos', onPressed: ()=>Navigator.pushNamed(context, 'empleos')),
                      ],
                    ),
                  ),
                   SizedBox(height: 40,),
                   Text('Repositorios', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
          Cabezera(user: authProvider.usuario!.nombre,),
        ],
      ),
   );
  }
}



class _Formulario extends StatelessWidget {
  final Usuario? user;
  const _Formulario({
    Key? key, required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final profileServices = Provider.of<ProfileProvider>(context); 
  final authProvider = Provider.of<Auth>(context); 
  final usuario = authProvider.usuario!;
    return Form(
      key: profileServices.formKey,
      child: Column(
        children: [
          SizedBox(height: 20,),
        Cascaron(child: TextFormField(
          initialValue: usuario.nombre,
        onChanged: (value){
        profileServices.nombre = value; 
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Nombre', labelText: 'Nombre', prefixIcon: Icons.title),
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
        
          SizedBox(height: 20,),
          
         
          // MaterialButton(
          //   color: Color(0xff0F1225),
          //   disabledColor: Colors.grey,
          //   onPressed: profileServices.isLoading ? null :  ()async{
          //       print(await Auth.getToken());
          //       profileServices.isLoading = true;
          //       // final resp = await auth.login(authProvider.usuario, authProvider.password);
          //       // if(resp){
          //       //   Navigator.pushReplacementNamed(context, '/');
          //       // }else{
          //       // authProvider.isLoading = false;
          //       // }
          //   },
          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
          //   child: Container(
          //     width: double.infinity,
          //     padding: EdgeInsets.all(20),
          //     child: Text('Ingresar',textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Color(0xff75F39F)),),
          //   ),
          //   ),
       
          
          
        ],
      ),
    );
  }
}

