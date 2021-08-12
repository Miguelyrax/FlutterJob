import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/auth.dart';
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
      color:jobProvider.color1 ,
      child: SafeArea(
        child: Stack(
          children: [
            
            _Cabezera(jobProvider: jobProvider),
            Positioned(right: -40,top: -40,child: circulo2(width: 160, color: jobProvider.color2,)),
            this.child
          ],
        ),
      )
    );
  }
}
class Background2 extends StatelessWidget {
  final Widget child;
  final Auth auth;
  const Background2({
    Key? key,
    required this.child, required this.auth,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color:Colors.white ,
      child: SafeArea(
        child: Stack(
          children: [
           
            Container(
              width: double.infinity,
              height: size.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Master Jobz', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text('Bienvenido ${auth.usuario!.nombre}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ],
              )
            ),
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
      padding: EdgeInsets.only(left: 40, top: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      SafeArea(child: Container()),
     IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_left, size: 50,),),
      Text('${jobProvider.job?.title}', style:TextStyle(fontSize: 60, fontWeight: FontWeight.bold) ,),
      Text('${jobProvider.job?.subtitle}', style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold) ,),
          ],
      ),
    );
  }
}