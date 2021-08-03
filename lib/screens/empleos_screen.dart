import 'package:flutter/material.dart';
import 'package:master_jobz/models/job.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/widgets/cabezera.dart';
import 'package:master_jobz/widgets/targeta.dart';
import 'package:provider/provider.dart';


class EmpleosScreen extends StatefulWidget {

  @override
  _EmpleosScreenState createState() => _EmpleosScreenState();
}

class _EmpleosScreenState extends State<EmpleosScreen> {
   final jobProvider = JobProvider();
  List<Job> jobs = [];
  @override
  void initState() { 
    _getJobs();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<Auth>(context);
    int numero = 1;
    Color color1 = Color(0xffF3D03E);
    Color color2 = Color(0xffA28B29);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 180,),
                  Text('Mis ofertas', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: ( _ , i) => SizedBox(height: 20,),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: jobs.length,
                      itemBuilder: ( context , i) {
                        if(numero == 1){
                          color1 = Color(0xffF3D03E);
                          color2 = Color(0xffA28B29);
                        }
                        if(numero == 2){
                          color1 = Color(0xff75F39F);
                          color2 = Color(0xff50AC6E);
                        }
                        if(numero == 3){
                          color1 = Color(0xff87CFF4);
                          color2 = Color(0xff588BA6);
                        }
                        numero++;
                        if(numero>3){
                          numero =1;
                        }
                      return Targeta(job: jobs[i], color: color1, color2: color2, onPressed: ()=>Navigator.pushNamed(context, 'editJob'),);
                    } ),
                  ),
                ],
              ),
            ),
          ),
          Cabezera(user: userProvider.usuario!.nombre)
        ],
      ),
   );
  }

  Future _getJobs() async{
    
    this.jobs = await jobProvider.getEmpleos();
     setState(() {
       
     });      
  }
}