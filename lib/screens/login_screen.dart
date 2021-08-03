import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/services/auth_provider.dart';
import 'package:master_jobz/ui/input_decoration.dart';
import 'package:master_jobz/widgets/auth_background.dart';
import 'package:master_jobz/widgets/contenedor.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                     child: _Formulario())
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text('¿No tienes una cuenta?'),
              SizedBox(height: 20,),
            ],),
        ),
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
          Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff0F1225)),
            borderRadius: BorderRadius.circular(36)
          ),
          child: TextFormField(
        onChanged: (value){
           authProvider.usuario = value; 
           
        },
        decoration: InputDecorations.authInputDecoration(hintText: 'Usuario', labelText: 'Usuario', prefixIcon: Icons.supervised_user_circle),
      ),
        ),
          SizedBox(height: 20,),
          Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff0F1225)),
            borderRadius: BorderRadius.circular(36)
          ),
          child: TextFormField(
            onChanged: (value){
              authProvider.password = value; 
              
            },
            decoration: InputDecorations.authInputDecoration(hintText: 'Password', labelText: 'Password', prefixIcon: Icons.password),
          ),
            ),
          SizedBox(height: 60,),
          MaterialButton(
            color: Color(0xff0F1225),
            disabledColor: Colors.grey,
            onPressed: authProvider.isLoading ? null :  ()async{
                print(await Auth.getToken());
                authProvider.isLoading = true;
                final resp = await auth.login(authProvider.usuario, authProvider.password);
                if(resp){
                  Navigator.pushReplacementNamed(context, '/');
                }else{
                authProvider.isLoading = false;
                }
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Text('Ingresar',textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Color(0xff75F39F)),),
            ),
            ),
          SizedBox(height: 20,),
          
          
        ],
      ),
    );
  }
}



