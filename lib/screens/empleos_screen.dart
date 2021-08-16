import 'package:flutter/material.dart';
import 'package:master_jobz/models/job.dart';

import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/widgets/alert.dart';

import 'package:master_jobz/widgets/circulo.dart';
import 'package:master_jobz/widgets/formularios.dart';
import 'package:master_jobz/widgets/targeta.dart';
import 'package:provider/provider.dart';

class EmpleosScreen extends StatefulWidget {

  @override
  _EmpleosScreenState createState() => _EmpleosScreenState();
}

class _EmpleosScreenState extends State<EmpleosScreen> with AutomaticKeepAliveClientMixin{
 
  
 
  @override
  Widget build(BuildContext context) {
    int numero = 1;
    Color color1 = Color(0xffF3D03E);
    Color color2 = Color(0xffA28B29);
    final jobProvider = Provider.of<JobProvider>(context);
  //  _getJobs();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mis ofertas', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Circulo(onPressed: ()=>editContacto(context, FormularioJob()), width: 40)
                  ],),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: ( _ , i) => SizedBox(height: 20,),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: jobProvider.empleos.length,
                      itemBuilder: ( context , i) {
                        if(numero == 1){
                            color1 = Color(0xffFDD93C);
                            color2 = Color(0xffFEF170);
                          }
                          if(numero == 2){
                            color1 = Color(0xffCA9FFF);
                            color2 = Color(0xffECB5FF);
                          }
                          if(numero == 3){
                            color1 = Color(0xff49E4EA);
                            color2 = Color(0xff81EFC8);
                          }
                          if(numero == 4){
                            color1 = Color(0xff8DD6FF);
                            color2 = Color(0xff9EDFFF);
                          }
                          numero++;
                          if(numero>4){
                            numero =1;
                          }
                      return Targeta(job: jobProvider.empleos[i], color: color1, color2: color2, number: i, onPressed: ()=>Navigator.pushNamed(context, 'editJob'),);
                    } ),
                  ),
                ],
              ),
            ),
          ),
          // Cabezera()
        ],
      ),
   );
  }

  // Future _getJobs() async{
  //   // final jobProvider = Provider.of<JobProvider>(context);
  //   jobProvider.jobs = await jobProviders.getEmpleos();
  //   print('caja');
  //   if (!mounted) { 
  //     return;
  //   }
  //    setState(() {
       
  //    });      
  // }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}