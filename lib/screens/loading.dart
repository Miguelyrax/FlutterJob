import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/screens/menu_screen.dart';
import 'package:master_jobz/screens/welcome_screen.dart';
import 'package:provider/provider.dart';


class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _isAuthenticated(context),
        builder: (context, snapshot) {
          return Center(
            child: Stack(
              children: [
                Text('MZ', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Transform.scale(
                  scale: 3,
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    color: Colors.black,
                  ),
                ),
                Transform.scale(
                  scale: 5,
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    color: Colors.black,
                  ),
                ),
              ],
            ),);
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