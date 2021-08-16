import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/services/auth_navegacion_provider.dart';
import 'package:master_jobz/services/auth_provider.dart';
import 'package:master_jobz/ui/input_decoration.dart';
import 'package:master_jobz/widgets/auth_background.dart';
import 'package:master_jobz/widgets/boton.dart';
import 'package:master_jobz/widgets/contenedor.dart';
import 'package:master_jobz/widgets/contenido.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authNavegacionProvider = Provider.of<AuthNavegacionProvider>(context);
    return Scaffold(
      
      body:PageView(
        physics: NeverScrollableScrollPhysics(),
          controller: authNavegacionProvider.pageController,
          children: [ AuthBackground(
        child: 
            SingleChildScrollView( 
              child: Column(
                children: [
                  SizedBox(height: 250,),
                  Contenedor(
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                       Text('Login', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                       ChangeNotifierProvider(
                         create: ( _ )=> AuthProvider(),
                         child: _Formulario()),
                         SizedBox(height: 50,),
                  GestureDetector(
                    onTap: (){
                      authNavegacionProvider.paginaActual = 1;
                    },
                    child: Text('¿No tienes una cuenta?')),
                  SizedBox(height: 100,),
                      ],
                    ),
                  ),
                  
                ],),
            
            ),
          ),
          AuthBackgroundRegister(
            child: SingleChildScrollView( 
                child: Column(
                  children: [
                    SizedBox(height: 120,),
                    Contenedor(
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                         ChangeNotifierProvider(
                           create: ( _ )=> AuthProvider(),
                           child: _Formulario2()),
                           SizedBox(height: 50,),
                    GestureDetector(
                      onTap: (){
                        authNavegacionProvider.paginaActual = 0;
                      },
                      child: Text('¿Ya tienes una cuenta?')),
                    SizedBox(height: 100,),
                        ],
                      ),
                    ),
                    
                  ],),
              
              ),
          ),
          ],
      ),
   );
  }
}

class _Formulario extends StatelessWidget {
  const _Formulario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final authProvider = Provider.of<AuthProvider>(context);
   final auth = Provider.of<Auth>(context);
    return Form(
      key: authProvider.formKey,
      child: Column(
        children: [
          SizedBox(height: 20,),
          Contenido(
          child: TextFormField(
        onChanged: (value){
       authProvider.usuario = value; 
       
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Usuario', labelText: 'Usuario', prefixIcon: Icons.supervised_user_circle),
      ),),
          SizedBox(height: 50,),
        
          Contenido(
           child: TextFormField(
            onChanged: (value){
              authProvider.password = value; 
              
            },
            decoration: InputDecorations.authInputDecoration(hintText: 'Password', labelText: 'Password', prefixIcon: Icons.password),
          ),),
            SizedBox(height: 50,),
          Boton(text: 'LOGIN', onPressed: authProvider.isLoading ? null :  ()async{
                print(await Auth.getToken());
                authProvider.isLoading = true;
                final resp = await auth.login(authProvider.usuario, authProvider.password);
                if(resp){
                  Navigator.pushReplacementNamed(context, 'loading');
                }else{
                authProvider.isLoading = false;
                }
            }),
          SizedBox(height: 20,),
          
          
        ],
      ),
    );
  }
}
class _Formulario2 extends StatelessWidget {
  const _Formulario2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final authProvider = Provider.of<AuthProvider>(context);
   final auth = Provider.of<Auth>(context);
    return Form(
      key: authProvider.formKey,
      child: Column(
        children: [
          SizedBox(height: 20,),
          Contenido(
          child: TextFormField(
        onChanged: (value){
       authProvider.nombre = value; 
       
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Nombre', labelText: 'Nombre', prefixIcon: Icons.title),
      ),),
      SizedBox(height: 50,),
          Contenido(
          child: TextFormField(
        onChanged: (value){
       authProvider.apellido = value; 
       
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Apellido', labelText: 'Apellido', prefixIcon: Icons.text_fields),
      ),),
      SizedBox(height: 50,),
          Contenido(
          child: TextFormField(
        onChanged: (value){
       authProvider.email = value; 
       
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Email', labelText: 'Email', prefixIcon: Icons.email),
      ),),
      SizedBox(height: 50,),
          Contenido(
          child: TextFormField(
        onChanged: (value){
       authProvider.password = value; 
       
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Password', labelText: 'Password', prefixIcon: Icons.lock),
      ),),
          SizedBox(height: 50,),
          Boton(text: 'REGISTRARSE', onPressed: authProvider.isLoading ? null :  ()async{
                
                authProvider.isLoading = true;
                final resp = await auth.register(authProvider.nombre, authProvider.apellido, authProvider.email, authProvider.password);
                if(resp){
                  Navigator.pushReplacementNamed(context, '/');
                }else{
                authProvider.isLoading = false;
                }
            }),
          SizedBox(height: 20,),
          
          
        ],
      ),
    );
  }
}





