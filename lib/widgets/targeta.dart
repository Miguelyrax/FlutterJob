import 'package:flutter/material.dart';
import 'package:master_jobz/models/job.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:provider/provider.dart';
class Targeta extends StatelessWidget {
  final Job job;
  final Function? onPressed;
  final Color color;
  final Color color2;
  const Targeta({
    Key? key,required  this.color,required  this.color2, required this.job, this.onPressed,
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
        ? Navigator.pushNamed(context, 'job')
        : this.onPressed!();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Container(
              width: size.width * 0.8,
              height: size.height*0.25,
              decoration: BoxDecoration(
                color: this.color,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 0.2,
                  spreadRadius: 0.2,
                  offset: Offset(0,2)
                  
                )]
              ),
            ),
            Positioned(right: -20,top: -20,child:circulo(width: size.width * 0.35, color: this.color2,)),
            Positioned(
              bottom: 40,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(job.title, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                  SizedBox(height:30),
                  Text(job.subtitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height:10),
                  Text('26/07/2021', style: TextStyle(color: Colors.black54)),
                ],
              ),
            )
    
          ],
        ),
      ),
    );
  }
}

class circulo extends StatelessWidget {
  final double width;
  final Color color;
  const circulo({
    Key? key,
     required this.width, required this.color,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: this.width,
        height: this.width,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: this.color),
          
          borderRadius: BorderRadius.circular(200)
        ),
        child: Center(
          child: Text('JS', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        ),
      );
  }
}