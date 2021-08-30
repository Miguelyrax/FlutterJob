import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:master_jobz/peticiones/jobs.dart';

import 'package:master_jobz/widgets/targeta.dart';
import 'package:provider/provider.dart';


class JobsScreen extends StatefulWidget {
  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> with AutomaticKeepAliveClientMixin {


  
  @override
  Widget build(BuildContext context) {
    int numero = 1;
    Color color1 = Color(0xffF3D03E);
    Color color2 = Color(0xffA28B29);
    final jobProvider = Provider.of<JobProvider>(context);
    return Scaffold(

            extendBody: true,
      backgroundColor: Colors.white,
      body: 
          Stack(
            children: [
              Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                
                  SizedBox(height: 50,),
                  Text('Trabajos', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    child: ListView.separated(
                      shrinkWrap: true,
                      reverse: true,
                        separatorBuilder: ( _ , i) => SizedBox(height: 20,),
                        physics: BouncingScrollPhysics(),
                        itemCount: jobProvider.jobs.length,
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
                          if(numero == 5){
                            color1 = Color(0xffDEFF60);
                            color2 = Color(0xffEAFE8C);
                          }
                          if(numero == 6){
                            color1 = Color(0xffFAA2AC);
                            color2 = Color(0xffFEB3B1);
                          }
                          numero++;
                          if(numero>6){
                            numero =1;
                          }
                        return FadeInLeft(from: i * 100 ,child: Targeta(job: jobProvider.jobs[i], color: color1, color2: color2, colocar: false, number: i,));
                      } ),
                  ),
                ],
              ),
            ),
          ),
     
            ],
          )
   );
  }

  

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

