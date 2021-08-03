import 'package:flutter/material.dart';
import 'package:master_jobz/models/job.dart';
import 'package:master_jobz/peticiones/auth.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/widgets/targeta.dart';
import 'package:provider/provider.dart';


class MenuScreen extends StatefulWidget {

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final jobProvider = JobProvider();
  List<Job> jobs = [];
  @override
  void initState() { 
    _cargarJobs();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    int numero = 1;
    Color color1 = Color(0xffF3D03E);
    Color color2 = Color(0xffA28B29);
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MasterJobz', style: TextStyle(fontSize: 20,color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            // await auth.logout();
            Navigator.pushNamed(context, 'profile');
          }, icon: CircleAvatar(child: Text('${auth.usuario!.nombre.substring(0,2)}',),  ),),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 70,),
          Text('Ultimos empleos', textAlign: TextAlign.start,),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 200,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: ListView.separated(
                shrinkWrap: true,
                  separatorBuilder: ( _ , i) => SizedBox(width: 20,),
                  scrollDirection: Axis.horizontal,
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
            ),
          ),
          SizedBox(height: 40,),
          _Btn(text: 'Buscar',onPressed: ()=>Navigator.pushNamed(context, 'jobs'),),
          SizedBox(height: 40,),
          _Btn(text: 'Publicar',onPressed: ()=>Navigator.pushNamed(context, 'Publicar'),),
        
        ],
      ),
   );
  }

  Future _cargarJobs() async{
      this.jobs = await jobProvider.getUltimosTres();
      setState(() {
        
      });
  }
}

class _Btn extends StatelessWidget {
  final String text;
  final Function onPressed;
  const _Btn({
    Key? key,required  this.text,required  this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child:ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child:  GestureDetector(
        onTap: ()=>this.onPressed(),
        child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff0F1225),
            ),
            child: Stack(
              children: [
                Positioned(top: -10,right: -10,child: _Circulo()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Align( alignment: Alignment.centerLeft,
                  child: Text(this.text, style: TextStyle(fontSize: 20, color: Color(0xff75F39F), fontWeight: FontWeight.bold),)))
              ],
            ),
          ),
      )
      ),
    );
  }
}

class _Circulo extends StatelessWidget {
  const _Circulo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff75F39F), width: 3),
        borderRadius: BorderRadius.circular(200,),
      ),
      child: Center(child: Text('MZ', style: TextStyle(color: Color(0xff75F39F), fontSize: 20, fontWeight: FontWeight.bold),)),
    );
  }
}

