import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/screens/menu_screen.dart';
import 'package:master_jobz/screens/welcome_screen.dart';
import 'package:provider/provider.dart';


class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _isAuthenticated(context),
        builder: (context, snapshot) {
          return Center(
            child: ElasticIn(
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            )
            );
        } ,
      )
   );
  }

  Future _isAuthenticated(BuildContext context) async{
    final auth = Provider.of<Auth>(context);

    
    final resp = await auth.renew();
    
    if(resp){
    
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(pageBuilder: (_,__,___)=>MenuScreen(),
        transitionDuration: Duration(milliseconds: 0))
        );
    }else{
      // Navigator.pushReplacementNamed(context, 'login');
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(pageBuilder: (_,__,___)=>WelcomeScreen(),
        transitionDuration: Duration(milliseconds: 0))
        );
    }
  }
}