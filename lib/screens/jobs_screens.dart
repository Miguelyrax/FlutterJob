import 'package:flutter/material.dart';
import 'package:master_jobz/models/job.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/widgets/cabezera.dart';
import 'package:master_jobz/widgets/targeta.dart';
import 'package:provider/provider.dart';


class JobsScreen extends StatefulWidget {
  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  
  @override
  Widget build(BuildContext context) {
    int numero = 1;
    Color color1 = Color(0xffF3D03E);
    Color color2 = Color(0xffA28B29);
    final jobProvider = Provider.of<JobProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
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
                  // Container(
                  //   height: 200, width: double.infinity,
                  //   child: PageView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: [ 
                  //     _Targetas(title: 'Ofrece empleo', imagen: 'new',),
                  //     _Targetas(title: 'Mejora tu CV', imagen: 'edit',),
                  //     _Targetas(title: 'Trabaja asi de facil', imagen: 'work',),
                  //   ],
                  //   ),
                  // ),
                  SizedBox(height: 50,),
                  Text('Trabajos', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    child: ListView.separated(
                      shrinkWrap: true,
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
                          numero++;
                          if(numero>4){
                            numero =1;
                          }
                        return Targeta(job: jobProvider.jobs[i], color: color1, color2: color2, colocar: false, number: i,);
                      } ),
                  ),
                ],
              ),
            ),
          ),
          // Cabezera()
            ],
          )
   );
  }

  

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _Targetas extends StatelessWidget {
  final String title;
  final String imagen;
  const _Targetas({
    Key? key, required this.title,required  this.imagen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(height: 100, width: 100,
      decoration: BoxDecoration(
      boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 2,
        spreadRadius: 0.2,
        offset: Offset(0,2)
      )],
      borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Stack(
        children: [
          Image(width: double.infinity,image: AssetImage('assets/$imagen.png'),fit: BoxFit.cover,),
          Align(alignment: Alignment.bottomCenter,child: Container(width: double.infinity, color: Color(0xffF5CB39),child: Text(this.title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)))
        ],
      )),),
    );
  }
}

