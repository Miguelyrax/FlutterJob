import 'package:flutter/material.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/screens/empleos_screen.dart';
import 'package:master_jobz/screens/jobs_screens.dart';
import 'package:master_jobz/screens/profile_publico_screen.dart';
import 'package:master_jobz/services/navegacion_provider.dart';

import 'package:provider/provider.dart';


class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

@override
  void initState() {
      final jobProvider = Provider.of<JobProvider>(context,listen: false);
    jobProvider.cargarTodo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    final auth = Provider.of<Auth>(context);
    final paginaProvider = Provider.of<NavegacionModel>(context);
    return  Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
         toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Good\nmorning', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),),
          ),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(onPressed: ()async{
              await auth.logout();
              Navigator.pushReplacementNamed(context, 'login');
            }, icon: Icon(Icons.logout_sharp, color: Colors.red,))
          ],  
          ),
          
          bottomNavigationBar: _Navegacion(paginaProvider:paginaProvider),
          body: _Paginas(paginaProvider:paginaProvider)
    
    );
  }
}

class _Navegacion extends StatelessWidget {
  final NavegacionModel paginaProvider;

  const _Navegacion({Key? key, required this.paginaProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return RollingBottomBar(
      enableIconRotation: true,
      flat: false,
      useActiveColorByDefault: true,
      color: Colors.black,
      onTap: (i)=>paginaProvider.paginaActual = i,
      activeItemColor: Colors.white,
      itemColor: Colors.white,
      items: [
        RollingBottomBarItem(Icons.home, label: 'Buscar', activeColor: Colors.redAccent),
          RollingBottomBarItem(Icons.folder, label: 'Ofertas', activeColor: Colors.blueAccent),
          RollingBottomBarItem(Icons.assignment_ind, label: 'Mi CV', activeColor: Colors.yellowAccent),
       

      ], controller: paginaProvider.pageController,
    );
  }
}

class _Paginas extends StatelessWidget {
  final NavegacionModel paginaProvider;

  const _Paginas({Key? key, required this.paginaProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paginaProvider = Provider.of<NavegacionModel>(context);
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: paginaProvider.pageController,
      children: [
        JobsScreen(),
        EmpleosScreen(),
        ProfilePublicoScreen(),
      ],
    );
  }
}

