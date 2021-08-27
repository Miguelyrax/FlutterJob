
import 'package:flutter/material.dart';
import 'package:master_jobz/models/requerimiento.dart';
import 'package:master_jobz/models/requisito.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/peticiones/postulantes.dart';

import 'package:master_jobz/screens/postulantes_screen.dart';
import 'package:master_jobz/services/edit_navegacion_services.dart';
import 'package:master_jobz/services/habilidad_services.dart';
import 'package:master_jobz/services/job_services.dart';
import 'package:master_jobz/services/requisitos_services.dart';

import 'package:master_jobz/ui/input_decoration.dart';
import 'package:master_jobz/ui/style_decoration.dart';
import 'package:master_jobz/widgets/alert.dart';


import 'package:master_jobz/widgets/cuerpo.dart';
import 'package:master_jobz/widgets/formularios.dart';
import 'package:master_jobz/widgets/pageroute.dart';
import 'package:provider/provider.dart';


class EditJobScreen extends StatefulWidget{
  @override
  _EditJobScreenState createState() => _EditJobScreenState();
}

class _EditJobScreenState extends State<EditJobScreen> with SingleTickerProviderStateMixin {
  final ctrlDescription = TextEditingController();

  final ctrlTitle = TextEditingController();

  final ctrlSubtitle = TextEditingController();

  final ctrlTtotalRequerido = TextEditingController();

  final ctrlRequerimiento = TextEditingController();
   late TabController _tabController ;
   List<Requerimiento> requerimientos = [];
   @override
  void initState() {  
    _tabController = TabController(length: 2, vsync: this);
    final jobProvider = Provider.of<JobProvider>(context,listen: false);
    final postulantesProvider = Provider.of<Postulantes>(context,listen: false);
    postulantesProvider.getTodo(jobProvider.job!.id);
    super.initState();
  }

   @override
  void dispose() {
    _tabController.dispose();
    ctrlDescription.dispose();
    ctrlTitle.dispose();
    ctrlSubtitle.dispose();
    ctrlTtotalRequerido.dispose();
    ctrlRequerimiento.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);
    final editNavegaion = Provider.of<EditNavegacionModel>(context);
    final jobServices = Provider.of<JobServices>(context);
    
    requerimientos = jobProvider.job!.requerimientos;
    ctrlDescription.text = jobProvider.job!.description;
    ctrlTitle.text = jobProvider.job!.title;
    ctrlSubtitle.text = jobProvider.job!.subtitle;
    ctrlTtotalRequerido.text = jobProvider.job!.totalRequerido.toString();
    

    return WillPopScope(
      onWillPop:jobServices.isLoading ? ()async{return false;}: ()async{
        FocusScope.of(context).unfocus();
        editNavegaion.paginaActual = 0;
        
        if(!jobServices.isValidForm()){
            return false;
        }else{
          jobServices.isLoading = true;
          if(jobServices.isLoading) {loading(context);} 
        await jobProvider.editJob(ctrlTitle.text, ctrlSubtitle.text, ctrlDescription.text, int.parse(ctrlTtotalRequerido.text), jobProvider.job!.id);     
        jobServices.isLoading = false;
        Navigator.pop(context);
        return true;
        }                                 
      },
      child: Scaffold(
        appBar: AppBar( 
          leading: IconButton(icon: Icon(Icons.arrow_back, size: 24,),onPressed: ()async{
          FocusScope.of(context).unfocus();
          editNavegaion.paginaActual = 0;
          if(!jobServices.isValidForm()) return;
          jobServices.isLoading = true;
          if(jobServices.isLoading) {loading(context);} 
          await jobProvider.editJob(ctrlTitle.text, ctrlSubtitle.text, ctrlDescription.text, int.parse(ctrlTtotalRequerido.text), jobProvider.job!.id);     
          Navigator.pop(context);
          Navigator.pop(context);
          jobServices.isLoading = false;
          },),      
          title: Text('Editar', style: TextStyle(color: Colors.black),),
          centerTitle: false,
          iconTheme: IconThemeData(
            color: Colors.red, 
          ),
          elevation: 1,
          backgroundColor:Colors.white,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (i) => editNavegaion.paginaActual = i,
          currentIndex: editNavegaion.paginaActual,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Trabajo'),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_outlined), label: 'Postulaciones'),
          ],
        ),
        body:
        PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: editNavegaion.pageController,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
                            child: Container(
                          
                            width: double.infinity,
                            
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                            
                            ),
                            child: Form(
                             key: jobServices.formKey,
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30,),
                                  Pad(child:Text('Título',style: TextStyleDecoration.textStyleDecoration(), )),
                                   Pad(
                                     title: true,
                                     child: TextFormField(
                                       maxLength: 11,
                                       controller: ctrlTitle,
                                       style: TextStyle(color: Colors.black45),
                                       validator:  (value){
                                        return (value != null && value.length >1 )
                                        ? null
                                        : 'El título debe tener mas de 1 caracter';
                                      },
                                        decoration: InputDecorations.editJobDecoration()
                                    ),
                                   ),
    
                                  Pad(child: Text('Sub título',style: TextStyleDecoration.textStyleDecoration(), )),
                                  Pad(title: true,child: TextFormField(
                                    maxLength: 18,style: TextStyle(color: Colors.black45),
                                    controller: ctrlSubtitle,
                                    validator:  (value){
                                    return (value != null && value.length >3 )
                                    ? null
                                    : 'El sub-título debe tener mas de 3 caracteres';
                                  },
                                    decoration: InputDecorations.editJobDecoration(),)),
                              
                                  Pad(child: _Estado()),
                                  Pad(child: Text('Descripción',style: TextStyleDecoration.textStyleDecoration(), )),
                                  
                                  Pad(
                                    title: true,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black45),
                                      maxLines: 8, controller: ctrlDescription,
                                      validator:  (value){
                                      return (value != null && value.length >8 )
                                      ? null
                                      : 'La descripción debe tener mas de 8 caractereres';
                                      },
                                      decoration: InputDecorations.editJobDecoration(),),
                                  ),
                                  Pad(
                                    child: Text('Habilidades esperadas',style: TextStyleDecoration.textStyleDecoration(),)),
                                      Container(width: double.infinity,
                                      child: MaterialButton(
                                        padding: EdgeInsets.only(left: 22),
                                        onPressed: (){
                                          setState(() {
                                            Navigator.push(context,ruta(ChangeNotifierProvider(create: ( _ ) => HabilidadServices(),child: FormularioRequerimiento()),Offset(2,0),true)
                                             );
                                          
                                          });
                                        },
                                        child: Align(alignment: Alignment.centerLeft,child: Text('Agregar habilidad', style: TextStyle(color: Colors.black45, fontSize: 15),)))),
                                      
                                      Container(
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                         separatorBuilder: ( _ ,i) => SizedBox(height: 20,),
                                         itemCount: requerimientos.length,
                                         itemBuilder: ( _ , i) {
                                           return Dismissible(key: UniqueKey(),background: Align(alignment: Alignment.centerLeft,child: Icon(Icons.delete, color: Colors.red, size: 40,)),direction: DismissDirection.startToEnd,onDismissed: (value)async{
                                            await jobProvider.deleteRequerimiento(requerimientos[i].id);
                                          },child: _Req(requerimiento: requerimientos[i],));
                                         },
                                         ),
                                      ),
                                      SizedBox(height: 40,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        PostulantesScreen()
          ],
        ),
       ),
    );
  }

  
}


class _Estado extends StatefulWidget {
  const _Estado({Key? key}) : super(key: key);

  @override
  __EstadoState createState() => __EstadoState();
}

class __EstadoState extends State<_Estado> {
  bool estado = false;
  @override
  Widget build(BuildContext context) {
  final jobProvider = Provider.of<JobProvider>(context);
  estado = jobProvider.job!.status == 'true' ? true : false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Estado',style: TextStyleDecoration.textStyleDecoration(),),
            Switch(
              activeColor: Colors.red,
              value: estado, onChanged: (value)async{
              final resp = await jobProvider.editStatus(jobProvider.job!.id, value.toString());
              if(resp){
                estado = value;
                setState(() { 
              });
              }
              
            })
          ],
        ),
        Container(
         
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xff0F1225),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(child: Text(jobProvider.job?.status == 'true'  ? 'Disponible' : 'Caducado',style: TextStyle(fontSize: 12, color: Colors.white),)  ,),
        )
      ],
    );
  }
}



class _Req extends StatefulWidget {
  
  final Requerimiento requerimiento;
  const _Req({
    Key? key,required this.requerimiento,
  }) : super(key: key);

  @override
  __ReqState createState() => __ReqState();
}

class __ReqState extends State<_Req> {
  final ctrlRequerimiento = TextEditingController();
  final ctrlRequisitos = TextEditingController();
  bool edit = false;
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);
    ctrlRequerimiento.text = widget.requerimiento.title;
     final number = new ValueNotifier(0);
    widget.requerimiento.total = widget.requerimiento.requisitos.length.toDouble();
    return ValueListenableBuilder(
      valueListenable: number,
      builder: (_,value, child) {
        return Column(
          children: [
                     Pad(
                       
                       child: ListTile(
                         title: edit ? TextFormField( controller: ctrlRequerimiento, decoration: InputDecorations.editRequerimiento(),)
                                     :Text('${widget.requerimiento.title}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ),), 
                         trailing:  IconButton(onPressed: (){
                                          Navigator.push(context,ruta(ChangeNotifierProvider(create: ( _ ) => HabilidadServices(),child: FormularioRequerimiento(requerimiento: widget.requerimiento,)),Offset(2,0),true));
                                        }, icon: Icon(Icons.edit))
                         ),
                     ),            
             SizedBox(height: 30,), 
             Container(
               child: ListView.separated(
                 physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               separatorBuilder: ( _ ,i) => SizedBox(height: 20,),
               itemCount: widget.requerimiento.requisitos.length,
               itemBuilder: ( _ , i) {
               return Pad(
                 title: true,
                 child: Column(
                   children: [
                     Dismissible(key: UniqueKey(),background: Align(alignment: Alignment.centerLeft,child: Icon(Icons.delete, color: Colors.red,)),direction: DismissDirection.startToEnd,onDismissed: (value)async{
                      await jobProvider.deleteRequisito(widget.requerimiento.requisitos[i].id,widget.requerimiento.id);
                     },child: _Requisito(requisito: widget.requerimiento.requisitos[i], requerimiento: widget.requerimiento, number: number,)),
                     
                   ],
                 ),
               );
              },    
              ),
              ) ,
              Container(width: double.infinity,
                           child: MaterialButton(
                           padding: EdgeInsets.only(left: 22),
                           onPressed: (){
                             jobProvider.requerimiento = widget.requerimiento;
                          Navigator.push(context,ruta(ChangeNotifierProvider(create: ( _ ) => RequisitosServices(),child: FormularioRequisito()),Offset(2,0),true));
                          },
                          child: Align(alignment: Alignment.centerLeft,child: Text('Agregar requisito', style: TextStyle(color: Colors.black45, fontSize: 15),)))),  
          ],
          );
      },
    );
  }
}

class _Requisito extends StatefulWidget {
  final ValueNotifier number;
  final Requisito requisito;
  final Requerimiento requerimiento;
  const _Requisito({
    Key? key, required this.requisito,required this.requerimiento,required this.number,
  }) : super(key: key);

  @override
  __RequisitoState createState() => __RequisitoState();
}

class __RequisitoState extends State<_Requisito> {
  final ctrlRequisito = TextEditingController();
  bool edit = false;
  @override
  Widget build(BuildContext context) {
    ctrlRequisito.text = widget.requisito.requisito;
    final jobProvider = Provider.of<JobProvider>(context);
    return ListTile(
                title: edit ? TextFormField( controller: ctrlRequisito, decoration: InputDecorations.editRequerimiento(),)
                            :Text('${widget.requisito.requisito}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38 , fontSize: 15),), 
                       trailing:  IconButton(onPressed: (){
                                  Navigator.push(context,ruta(ChangeNotifierProvider(create: ( _ ) => RequisitosServices(),child: FormularioRequisito(requisito: widget.requisito,)),Offset(2,0),true));
                                  }, icon: Icon(Icons.edit))
                 ); 
    
  }
}


