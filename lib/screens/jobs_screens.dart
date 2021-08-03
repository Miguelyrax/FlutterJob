import 'package:flutter/material.dart';
import 'package:master_jobz/models/job.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/widgets/targeta.dart';
import 'package:provider/provider.dart';


class JobsScreen extends StatefulWidget {
  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final jobProvider = JobProvider();
  List<Job> jobs = [];
  @override
  void initState() { 
    _getJobs();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    int numero = 1;
    Color color1 = Color(0xffF3D03E);
    Color color2 = Color(0xffA28B29);
    return Scaffold(
      appBar: AppBar(
        title: Text('MasterJobz', style: TextStyle(fontSize: 20,color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: null,
        actions: [
          IconButton(onPressed: (){
           
            
          }, icon: CircleAvatar(child: Text('MA',),  ),),
          SizedBox(width: 20,)
        ],
      ),
      body: 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: ListView.separated(
              separatorBuilder: ( _ , i) => SizedBox(height: 20,),
              physics: BouncingScrollPhysics(),
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
              return Targeta(job: jobs[i], color: color1, color2: color2,);
            } ),
          )
   );
  }

  Future _getJobs() async{
    
    this.jobs = await jobProvider.getJobs();
     setState(() {
       
     });      
  }
}