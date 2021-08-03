import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/widgets/targeta.dart';
class Background extends StatelessWidget {
  final Widget child;
  final JobProvider jobProvider;
  const Background({
    Key? key,
    required this.jobProvider,required this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color:jobProvider.color1,
      child: SafeArea(
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.only(left: 20, top: 10),child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_left, size: 50,),)),
            _Cabezera(jobProvider: jobProvider),
            Positioned(right: -30,top: -30,child: circulo(width: 160, color: jobProvider.color2)),
            this.child
          ],
        ),
      )
    );
  }
}

class _Cabezera extends StatelessWidget {
  const _Cabezera({
    Key? key,
    required this.jobProvider,
  }) : super(key: key);

  final JobProvider jobProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, top: 60),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      SafeArea(child: Container()),
      SizedBox(height: 20,),
      Text('${jobProvider.job?.title}', style:TextStyle(fontSize: 60, fontWeight: FontWeight.bold) ,),
      Text('${jobProvider.job?.subtitle}', style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold) ,),
          ],
      ),
    );
  }
}