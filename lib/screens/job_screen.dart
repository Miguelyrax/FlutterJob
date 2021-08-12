import 'package:flutter/material.dart';
import 'package:master_jobz/models/requerimiento.dart';
import 'package:master_jobz/models/requisito.dart';
import 'package:master_jobz/peticiones/jobs.dart';
import 'package:master_jobz/widgets/alert.dart';
import 'package:master_jobz/widgets/background.dart';
import 'package:provider/provider.dart';


class JobScreen extends StatelessWidget{
   List<Requerimiento> requerimientos = [];
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);
    requerimientos = jobProvider.job!.requerimientos;
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
                        _Estado( jobProvider: jobProvider,),
                        SizedBox(height: 30,),
                        Text('Descripción',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ),),
                        SizedBox(height: 30,),
                        Text('${jobProvider.job?.description}',style: TextStyle(fontSize: 15,  ),),
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
                                 return _Req(requerimiento: requerimientos[i],);
                               },
                               ),
                            ),
                            SizedBox(height: 40,),
                            Center(
                              child: MaterialButton(onPressed: jobProvider.job!.status == 'false' ? null : ()async{
                                if(jobProvider.getTotal() == true){
                                  final resp = await jobProvider.postular();
                                  if(resp){
                                    alertOk(context, true, 'Tu postulacion ha sido enviada');
                                  }else{
                                    alertOk(context, false, 'Ya has postulado a este cargo');
                                  }
                                }else{
                                  alertOk(context, false, 'Complete los requerimientos');
                                }
                                
                              },
                              disabledColor: Colors.grey,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              color: Color(0xff0F1225),
                              minWidth: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child:  Text('Postular',style: TextStyle(fontSize: 25, color: Color(0xff75F39F)))
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
  @override
  Widget build(BuildContext context) {
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
                 Text('${widget.requerimiento.title}',style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold ),),
                  Text('% ${this.widget.requerimiento.suma.toInt()}',style: TextStyle(fontSize: 35,  ),),
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
               return _Requisito(requisito: widget.requerimiento.requisitos[i], requerimiento: widget.requerimiento, number: number,);
              },    
              ),
              ) 
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 2,
          child: Checkbox(
            value: 
            widget.requisito.status,
            onChanged: (value){
            
             widget.requisito.status = value!;
             if(value == true){
               widget.number.value++;
               widget.requerimiento.suma = widget.requerimiento.suma + 100 / widget.requerimiento.total;   
             }else{
               widget.requerimiento.suma = widget.requerimiento.suma - 100 / widget.requerimiento.total; 
               widget.number.value++;
             }
             setState(() {
               
             });
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
          ),
        ),
        Text('${widget.requisito.requisito}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38 , fontSize: 15),)
      ],
    );
  }
}

class _Estado extends StatelessWidget {
  final JobProvider jobProvider;
  const _Estado({
    Key? key,required this.jobProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Estado',style: TextStyle(fontSize: 20),),
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

