import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:master_jobz/screens/login_screen.dart';
import 'package:master_jobz/widgets/boton.dart';
import 'package:master_jobz/widgets/pageroute.dart';


class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color(0xff1D1D1B),

            ]
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(height: 50,),
              FadeInLeft(
                child: Image(
                  image:AssetImage('assets/intro2.png') ,),
              ),
                SizedBox(height: 100,),
                Text('GJoob',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 22),),
                SizedBox(height: 10,),
                Text('Encuentra el empleo de tus sueños con un solo click',textAlign: TextAlign.center, style: TextStyle(color: Colors.white60, fontSize: 12),),
                SizedBox(height: 50,),
                BounceInUp(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Boton(text: 'Comenzar', onPressed: ()=>Navigator.push(context,ruta(LoginScreen(),Offset(2,0),true)), color: Colors.white,)),
                )
            ],
          ),
        ),
      ),
   );
  }
}