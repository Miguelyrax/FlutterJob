import 'package:flutter/material.dart';
import 'package:master_jobz/models/job.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/screens/job_screen.dart';
import 'package:master_jobz/widgets/pageroute.dart';
import 'package:provider/provider.dart';
class Targeta extends StatelessWidget {
  final Job job;
  final int number;
  final Function? onPressed;
  final Color color;
  final bool colocar;
  final Color color2;
  const Targeta({
    Key? key,required  this.color,required  this.color2, required this.job, this.onPressed, this.colocar = true, required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final jobProvider = Provider.of<JobProvider>(context);
    return GestureDetector(
      onTap: (){
        jobProvider.job = job;
        jobProvider.color1 = color;
        jobProvider.color2 = color2;
        onPressed == null
        ? Navigator.push(
        context,
        ruta(JobScreen(), Offset(0,2), true)
        )
        : this.onPressed!();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Container(
                width: size.width ,
                height: size.height*0.45,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      color,
                      color2,
                    ]
                  ),
                  color: this.color,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 0.2,
                    spreadRadius: 2,
                    offset: Offset(0,2)
                    
                  )]
                ),
              ),
           
            
            Positioned(right: -30,top: -30,child:circulo2(width: size.width * 0.35, color: Colors.black12,)),
            
            Positioned(
              top: 0,
              left: 30,
              child: Container(
                width: size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${this.number}', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),),
                    SizedBox(height:30),
                    Text(job.title, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                    Text(job.subtitle, style: TextStyle(fontSize:30, fontWeight: FontWeight.bold)),
                    SizedBox(height:10),
                    Text('26/07/2021', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            )
    
          ],
        ),
      ),
    );
  }
}


class circulo2 extends StatelessWidget {
  final double width;
  final Color color;
  const circulo2({
    Key? key,
     required this.width, required this.color,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: this.width,
        height: this.width,
        decoration: BoxDecoration(
          border: Border.all(width: 25, color: this.color),
          
          borderRadius: BorderRadius.circular(200)
        ),
        
      );
  }
}