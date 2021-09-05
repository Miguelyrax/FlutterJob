import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:master_jobz/helpers/environment.dart';
import 'package:master_jobz/screens/login_screen.dart';
import 'package:master_jobz/widgets/boton.dart';
import 'package:master_jobz/widgets/pageroute.dart';


class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double valor = 0;
  final _pageViewcontroller = new PageController();
  double get pageViewcontroller => valor;
  set pageViewcontroller(double value){
    valor = value;
    setState(() {
      
    });
  }
  @override
  void initState() { 
    _pageViewcontroller.addListener(() {
     pageViewcontroller = _pageViewcontroller.page!;
     });
    super.initState();
    
  }
  @override
  void dispose() {
    _pageViewcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color:Colors.white,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    SizedBox(height: 20,),
                    Image(
                       image: AssetImage('assets/logo.png'),
                       width: 200,
                       height: 100,
                      ),
                   FadeInLeft(
                     child: Container(
                       width: double.infinity,
                       height: 450,
                       child: PageView(
                         controller: _pageViewcontroller,
                         children: [
                           Column(
                             children: [
                               Image(image: AssetImage('assets/bro.png') ,),
                               Text('Progresa',textAlign: TextAlign.center, style: TextStyle( fontSize: 22),),
                               Text('Atrevete a confiar en tus capacidades',textAlign: TextAlign.center, style: TextStyle( fontSize: 12),),
                             ],
                           ),
                           Column(
                             children: [
                               Image(image: AssetImage('assets/body.png') ,),
                               Text('Confía',textAlign: TextAlign.center, style: TextStyle( fontSize: 22),),
                               Text('Busca y publica nuevos empleos',textAlign: TextAlign.center, style: TextStyle( fontSize: 12),),
                             ],
                           ),
                           Column(
                             children: [
                               Image(image: AssetImage('assets/work.png') ,),
                               Text('Adaptate',textAlign: TextAlign.center, style: TextStyle( fontSize: 22),),
                               Text('Trabaja en el lugar de tus sueños',textAlign: TextAlign.center, style: TextStyle( fontSize: 12),),
                             ],
                           ),
                     
                         ],
                       ),),
                   ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(Icons.brightness_1, color: valor <= 0.5  ? Environment.rojo :Colors.grey,),
                         Icon(Icons.brightness_1, color: valor >0.5 && valor <= 1.5  ? Environment.rojo :Colors.grey,),
                         Icon(Icons.brightness_1, color: valor >1.5 ? Environment.rojo :Colors.grey,),
                       ],
                     ),
                 SizedBox(height: 50,),
                    
                     Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        child: Boton(text: 'Comenzar', onPressed: ()=>Navigator.pushReplacement(context,ruta(LoginScreen(),Offset(0,2),true)),)),
                    
                ],
              ),
            ),
          ],
        ),
      ),
   );
  }
}