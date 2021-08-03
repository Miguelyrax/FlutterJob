
import 'package:flutter/material.dart';
import 'package:master_jobz/models/requerimiento.dart';
import 'package:master_jobz/models/requisito.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/widgets/alert.dart';
import 'package:master_jobz/widgets/background.dart';
import 'package:master_jobz/widgets/circulo.dart';
import 'package:provider/provider.dart';


class EditJobScreen extends StatefulWidget{
  @override
  _EditJobScreenState createState() => _EditJobScreenState();
}

class _EditJobScreenState extends State<EditJobScreen> {
  final ctrlDescription = TextEditingController();

  final ctrlTitle = TextEditingController();

  final ctrlSubtitle = TextEditingController();

  final ctrlTtotalRequerido = TextEditingController();

  final ctrlRequerimiento = TextEditingController();
   List<Requerimiento> requerimientos = [];

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);
    requerimientos = jobProvider.job!.requerimientos;
    ctrlDescription.text = jobProvider.job!.description;
    ctrlTitle.text = jobProvider.job!.title;
    ctrlSubtitle.text = jobProvider.job!.subtitle;
    ctrlTtotalRequerido.text = jobProvider.job!.totalRequerido.toString();
    bool estado =false;
    return Scaffold(
      
      body:Background(jobProvider: jobProvider,
               child:SingleChildScrollView(
                  child: Container(
                  margin: EdgeInsets.only(top: 200),
                  width: double.infinity,
                  
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 7,
                    offset: Offset(0,-2),
                    spreadRadius: 1
                  )]
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Text('Título',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ), ),
                         TextFormField(
                           maxLength: 5,
                           controller: ctrlTitle,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                        ),

                        Text('Sub título',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ), ),
                        TextFormField(maxLength: 18,controller: ctrlSubtitle, decoration: InputDecoration(border: OutlineInputBorder(),),),
                        SizedBox(height: 20,),
                        _estado(jobProvider,estado),
                        Text('Descripción',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ), ),
                        SizedBox(height: 30,),
                        TextFormField(maxLines: 8, controller: ctrlDescription, decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          counterText: ctrlDescription.text.length.toString(),

                        ),),
                        Text('Total requerido',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ), ),
                        SizedBox(height: 30,),
                        TextFormField( controller: ctrlTtotalRequerido, decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          counterText: ctrlDescription.text.length.toString(),

                        ),),
                        
                        SizedBox(height: 30,),
                        Text('Habilidades esperadas',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ),),
                            SizedBox(height: 30,),
                            
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
                            Circulo(onPressed: (){
                              setState(() {
                                editAlert(context, ctrlRequerimiento);
                              });
                            }),
                            SizedBox(height: 40,),
                            Center(
                              child: MaterialButton(onPressed: ()async{
                                await jobProvider.editJob(ctrlTitle.text, ctrlSubtitle.text, ctrlDescription.text, int.parse(ctrlTtotalRequerido.text), jobProvider.job!.id);
                              },
                              disabledColor: Colors.grey,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              color: Color(0xff0F1225),
                              minWidth: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child:  Text('Guardar',style: TextStyle(fontSize: 25, color: Color(0xff75F39F)))
                              ),
                            )
                           
                          
                      ],
                    ),
                  ),
                ),
              ),
          ),
         
       
   );
  }

  Widget _estado(JobProvider jobProvider, bool estado) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Estado',style: TextStyle(fontSize: 20),),
            Switch(value: estado, onChanged: (value){
              print(value);
            
              estado = value;
              setState(() {
                
              });
            })
          ],
        ),
        Container(
          width: 100,
          height: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xff0F1225),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(child: Text(jobProvider.job?.status == 'true'  ? 'Disponible' : 'Caducado',style: TextStyle(fontSize: 15, color: Color(0xff75F39F)),)  ,),
        )
      ],
    );
  }
}

class _Contenedor extends StatelessWidget {
  const _Contenedor({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black45),
        borderRadius: BorderRadius.circular(10)
      ),
      child: this.child );
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
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   edit 
                   ?Row(children: [Container(
                     width: 100,
                     child: TextFormField( controller: ctrlRequerimiento, decoration: InputDecoration(border: OutlineInputBorder(),  ),),
                   ),
                   SizedBox(width: 10,),
                   Circulo(icon: Icons.save,onPressed: ()async{
                    final resp = await jobProvider.editRequerimiento(widget.requerimiento.id, ctrlRequerimiento.text);
                    if(resp){
                     print('Ok');
                    }else{
                     print('Error');
                    }
                     edit = !edit;
                   setState(() {
                   });
                 }),
                   ],)
                   :
                  Text('${widget.requerimiento.title}',style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold ),),
                 Circulo(icon: Icons.edit,onPressed: (){
                   setState((){
                     
                     edit = !edit;
                   });
                 }),
                 
                 ],
             ),    
             SizedBox(height: 30,), 
             Container(
               child: ListView.separated(
                 physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               separatorBuilder: ( _ ,i) => SizedBox(height: 20,),
               itemCount: widget.requerimiento.requisitos.length,
               itemBuilder: ( _ , i) {
               return Column(
                 children: [
                   Dismissible(key: UniqueKey(),background: Align(alignment: Alignment.centerLeft,child: Icon(Icons.delete, color: Colors.red,)),direction: DismissDirection.startToEnd,onDismissed: (value)async{
                    await jobProvider.deleteRequisito(widget.requerimiento.requisitos[i].id,widget.requerimiento.id);
                   },child: _Requisito(requisito: widget.requerimiento.requisitos[i], requerimiento: widget.requerimiento, number: number,)),
                   
                 ],
               );
              },    
              ),
              ) ,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                     SizedBox(),
                     IconButton(onPressed: (){
                       setState(() {
                                editReqAlert(context, ctrlRequisitos, widget.requerimiento.id);
                      });
                     }, icon: Icon(Icons.add))
                   ],)
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
    return Row(
      children: [
        edit 
        ?Row(children: [Container(
                     width: 160,
                     child: TextFormField( controller: ctrlRequisito, decoration: InputDecoration(border: OutlineInputBorder(),  ),),
                   ),
                   SizedBox(width: 10,),
                   IconButton(onPressed: ()async{
                      final resp = await jobProvider.editRequisito(widget.requisito.id, ctrlRequisito.text);
                      if(resp){
                        print('Ok');
                      }else{
                        print('Error');
                      }
                      edit=!edit;
                      setState(() {
                        
                      });
                    }, icon: Icon(Icons.save))
        ],)
        : Text('${widget.requisito.requisito}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38 , fontSize: 15),),
        
        IconButton(onPressed: (){
          edit=!edit;
          setState(() {
            
          });
        }, icon: Icon(Icons.edit))
      ],
    );
  }
}


