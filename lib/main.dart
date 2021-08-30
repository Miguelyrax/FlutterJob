import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/peticiones/postulantes.dart';
import 'package:master_jobz/screens/edit_job_screen.dart';
import 'package:master_jobz/screens/empleos_screen.dart';

import 'package:master_jobz/screens/jobs_screens.dart';
import 'package:master_jobz/screens/loading.dart';
import 'package:master_jobz/screens/login_screen.dart';
import 'package:master_jobz/screens/menu_screen.dart';

import 'package:master_jobz/screens/postulantes_screen.dart';
import 'package:master_jobz/screens/profile_publico_screen.dart';
import 'package:master_jobz/screens/profile_screen.dart';
import 'package:master_jobz/screens/welcome_screen.dart';
import 'package:master_jobz/services/auth_navegacion_provider.dart';

import 'package:master_jobz/services/navegacion_provider.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => Auth(),),
        ChangeNotifierProvider(create: ( _ ) => JobProvider(),),
        ChangeNotifierProvider(create: ( _ ) => Postulantes(),),
        ChangeNotifierProvider(create: ( _ ) => NavegacionModel(),),
        ChangeNotifierProvider(create: ( _ ) => AuthNavegacionProvider(),),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'RobotoMono'),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'loading',
        routes: {
          'login' : ( _ ) => LoginScreen(),
          'welcome' : ( _ ) => WelcomeScreen(),
          '/' : ( _ ) => MenuScreen(),
          'loading' : ( _ ) => LoadingScreen(),
          'jobs' : ( _ ) => JobsScreen(),
          'profile' : ( _ ) => ProfileScreen(),
          'profilePublico' : ( _ ) => ProfilePublicoScreen(),
          'empleos' : ( _ ) => EmpleosScreen(),
          'editJob' : ( _ ) => EditJobScreen(),
          'postulantes' : ( _ ) => PostulantesScreen(),

        },
      ),
    );
  }
}